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

let t =
  Dream.scope "" []
    ([
       make ~permanent:true [ ("feed.xml", "planet.xml") ];
       make [ ("/blog", "/ocaml-planet") ];
       make ~permanent:true [ ("/opportunities", "/jobs") ];
       make ~permanent:true [ ("/privacy-policy", "/policies/privacy-policy") ];
       make ~permanent:true
         [ ("/code-of-conduct", "/policies/code-of-conduct") ];
       make ~permanent:true [ ("/opportunities", "/jobs") ];
       (* make ~permanent:false [ (Url.conferences, Url.community ^
          "#conferences") ]; *)
       Dream.get "/p/:name" package;
       Dream.get "/u/:hash/p/:name" package;
       Dream.get "/p/:name/doc" package_docs;
     ])
