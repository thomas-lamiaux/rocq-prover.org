open Rocqproverorg

let make ?(permanent = false) t =
  let status = if permanent then `Moved_Permanently else `See_Other in
  Dream.scope ""
    [ Dream_encoding.compress ]
    (List.filter_map
       (fun (origin, new_) ->
         if origin = new_ then None
         else
           Some (Dream.get origin (fun req -> Dream.redirect ~status req new_)))
       t)

let package req =
  let package = Dream.param req "name" in
  Dream.redirect req (Url.Package.overview package)

let package_docs req =
  let package = Dream.param req "name" in
  Dream.redirect req (Url.Package.documentation package)

let opam_www req =
  Dream.(redirect ~status:`Moved_Permanently req "/packages")

let opam req =
  Dream.(redirect ~status:`Found req ("https://coq.github.io" ^ target req))

let http_or_404 ?(not_found = Rocqproverorg_frontend.not_found) opt f =
  Option.fold ~none:(Dream.html ~code:404 (not_found ())) ~some:f opt

let distrib req =
  let target = Dream.target req in
  let path = String.split_on_char '/' target in
  let newurl = match path with
  | "" :: "distrib" :: version :: component :: tail ->
    (match version with 
    | "current" -> (match component with
      | "refman" -> Some ("/refman" ^ String.concat "/" tail)
    |   "stdlib" -> Some ("/stdlib" ^ String.concat "/" tail)
      | _ ->  None)
    | version -> 
      (match component with
      | "refman" -> Some ("/doc/" ^ version ^ "/refman/" ^ String.concat "/" tail)
    |   "stdlib" -> Some ("/doc/" ^ version ^ "/stdlib/" ^ String.concat "/" tail)
      | _ ->  None))
  | "" :: "library" :: tail -> Some ("/stdlib" ^ String.concat "/" tail)
  | _ -> None
  in
  http_or_404 newurl Dream.(redirect ~status:`Found req)

let old_sites_modules req =
  Dream.(redirect ~status:`Found req ("https://coq.github.io" ^ target req))

let documentation req =
  Dream.(redirect ~status:`Moved_Permanently req "/learn")

let opam_packaging req =
  Dream.(redirect ~status:`Found req ("https://coq.github.io" ^ target req)))
  

let t =
  Dream.scope "" []
    ([
       make ~permanent:true [ ("roadmap.html", "/roadmap") ];
       make ~permanent:true [ ("favicon.ico"), "/logos/favicon.ico"];
       Dream.get "/p/:name" package;
       Dream.get "/u/:hash/p/:name" package;
       Dream.get "/p/:name/doc" package_docs;
       Dream.get "/opam/www" opam_www;
       Dream.get "/opam/www/**" opam_www;
       Dream.get "/coq-package-index" opam_www;
       Dream.get "/opam/**" opam;
       Dream.get "/distrib/**" distrib;
       Dream.get "/sites/**" old_sites_modules;
       Dream.get "/modules/**" old_sites_modules;
       Dream.get "/documentation" documentation;
       Dream.get "/opam-packaging.html" opam_packaging
       Dream.get "/opam-packaging" opam_packaging
     ])
