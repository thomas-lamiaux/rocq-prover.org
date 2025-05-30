module Academic_institution = struct
  type location = { lat : float; long : float } [@@deriving of_yaml, show]

  let pp_ptime fmt t =
    Format.pp_print_string fmt "Ptime.of_rfc3339 \"";
    Ptime.pp_rfc3339 () fmt t;
    Format.pp_print_string fmt
      "\" |> function Ok (t, _, _) -> t | Error _ -> failwith \"RFC 3339\""

  let pp_print_option pp fmt = function
    | None -> Format.pp_print_string fmt "None"
    | Some x ->
        Format.pp_print_string fmt "Some (";
        pp fmt x;
        Format.pp_print_string fmt ")"

  type course = {
    name : string;
    acronym : string option;
    url : string option;
    teacher : string option;
    enrollment : string option;
    year : int option;
    description : string;
    last_check : Ptime.t option; [@printer pp_print_option pp_ptime]
    lecture_notes : bool;
    exercises : bool;
    video_recordings : bool;
  }
  [@@deriving show]

  type t = {
    name : string;
    slug : string;
    description : string;
    url : string;
    logo : string option;
    continent : string;
    courses : course list;
    location : location option;
    featured : bool option;
    image : string option;
    alternate_logo : string option;
    body_md : string;
    body_html : string;
  }
  [@@deriving show]
end

module Academic_testimonial = struct
  type t = {
    testimony : string;
    authors : string;
    title : string;
    publication : string;
    year : string;
  }
  [@@deriving of_yaml, show]
end

module Blog = struct
  type source = {
    id : string;
    name : string;
    url : string;
    description : string;
    disabled : bool;
  }
  [@@deriving show]

  module Post = struct
    type t = {
      title : string;
      url : string;
      slug : string;
      source : source;
      description : string option;
      authors : string list;
      date : string;
      preview_image : string option;
      body_html : string;
    }
    [@@deriving show]
  end
end

module Book = struct
  type difficulty = Beginner | Intermediate | Advanced [@@deriving show]

  let difficulty_of_string = function
    | "beginner" -> Ok Beginner
    | "intermediate" -> Ok Intermediate
    | "advanced" -> Ok Advanced
    | s -> Error (`Msg ("Unknown difficulty type: " ^ s))

  let difficulty_of_yaml = function
    | `String s -> difficulty_of_string s
    | _ -> Error (`Msg "Expected a string for difficulty type")

  type link = { description : string; uri : string } [@@deriving of_yaml, show]

  type t = {
    title : string;
    slug : string;
    description : string;
    recommendation : string option;
    authors : string list;
    language : string list;
    published : string;
    cover : string;
    isbn : string option;
    links : link list;
    difficulty : difficulty;
    pricing : string;
    body_md : string;
    body_html : string;
  }
  [@@deriving show]
end

module Changelog = struct
  type t = {
    title : string;
    slug : string;
    date : string;
    tags : string list;
    changelog_html : string option;
    body_html : string;
    body : string;
    authors : string list;
  }
  [@@deriving of_yaml, show]
end

module Code_examples = struct
  type t = { title : string; body : string } [@@deriving show]
end

module Cookbook = struct
  type category = {
    title : string;
    slug : string;
    subcategories : category list;
  }
  [@@deriving show]

  type task = {
    title : string;
    slug : string;
    category_path : string list;
    description : string option;
  }
  [@@deriving show]

  type code_block_with_explanation = { code : string; explanation : string }
  [@@deriving show]

  type package = {
    name : string;
    tested_version : string;
    used_libraries : string list;
  }
  [@@deriving of_yaml, show]

  type t = {
    slug : string;
    filepath : string;
    task : task;
    packages : package list;
    code_blocks : code_block_with_explanation list;
    code_plaintext : string;
    discussion_html : string;
  }
  [@@deriving show]
end

module Event = struct
  type event_type = Meetup | Conference | Seminar | Hackathon | Retreat
  [@@deriving show]

  let event_type_of_string = function
    | "meetup" -> Ok Meetup
    | "conference" -> Ok Conference
    | "seminar" -> Ok Seminar
    | "hackathon" -> Ok Hackathon
    | "retreat" -> Ok Retreat
    | s -> Error (`Msg ("Unknown event type: " ^ s))

  let event_type_of_yaml = function
    | `String s -> event_type_of_string s
    | _ -> Error (`Msg "Expected a string for difficulty type")

  type location = { lat : float; long : float } [@@deriving of_yaml, show]

  type recurring_event = {
    title : string;
    url : string;
    slug : string;
    country : string;
    city : string;
    location : location option;
    event_type : event_type;
  }
  [@@deriving of_yaml, show]

  type utc_datetime = { yyyy_mm_dd : string; utc_hh_mm : string option }
  [@@deriving of_yaml, show]

  type t = {
    title : string;
    url : string;
    slug : string;
    country : string;
    city : string;
    location : location option;
    starts : utc_datetime;
    submission_deadline : utc_datetime option;
    registration_deadline : utc_datetime option;
    author_notification_date : utc_datetime option;
    ends : utc_datetime option;
    body_md : string;
    body_html : string;
    recurring_event : recurring_event option;
    event_type : event_type;
  }
  [@@deriving show]
end

module Exercise = struct
  type difficulty = Beginner | Intermediate | Advanced [@@deriving show]

  let of_string = function
    | "beginner" -> Ok Beginner
    | "intermediate" -> Ok Intermediate
    | "advanced" -> Ok Advanced
    | s -> Error (`Msg ("Unknown difficulty type: " ^ s))

  let difficulty_of_yaml = function
    | `String s -> of_string s
    | _ -> Error (`Msg "Expected a string for difficulty type")

  type t = {
    title : string;
    slug : string;
    difficulty : difficulty;
    tags : string list;
    description : string;
    statement : string;
    solution : string;
    tutorials : string list;
  }
  [@@deriving show]
end

module Governance = struct
  module Member = struct
    type t = { name : string; github : string; role : string option }
    [@@deriving of_yaml, show]

    let compare a b = String.compare a.github b.github
  end

  type contact_kind = GitHub | Email | Discord | Chat [@@deriving show]

  let contact_kind_of_yaml = function
    | `String "github" -> Ok GitHub
    | `String "email" -> Ok Email
    | `String "discord" -> Ok Discord
    | `String "chat" -> Ok Chat
    | x -> (
        match Yaml.to_string x with
        | Ok str ->
            Error
              (`Msg
                ("\"" ^ str
               ^ "\" is not a valid contact_kind! valid options are: github, \
                  email, discord, chat"))
        | Error _ -> Error (`Msg "Invalid Yaml value"))

  let contact_kind_to_yaml = function
    | GitHub -> `String "github"
    | Email -> `String "email"
    | Discord -> `String "discord"
    | Chat -> `String "chat"

  type contact = { name : string; link : string; kind : contact_kind }
  [@@deriving of_yaml, show]

  type dev_meeting = {
    date : string;
    time : string;
    link : string;
    calendar : string option;
    notes : string;
  }
  [@@deriving of_yaml, show]

  type team = {
    id : string;
    name : string;
    description : string; [@default ""]
    default_role : string; [@default "Maintainer"]
    contacts : contact list; [@default []]
    dev_meeting : dev_meeting option; [@default None]
    members : Member.t list; [@default []]
    subteams : team list; [@default []]
  }
  [@@deriving of_yaml, show]
end

module Industrial_user = struct
  type t = {
    name : string;
    slug : string;
    description : string;
    logo : string option;
    url : string;
    locations : string list;
    consortium : bool;
    featured : bool;
    body_md : string;
    body_html : string;
  }
  [@@deriving show]
end

module Job = struct
  type t = {
    title : string;
    link : string;
    locations : string list;
    publication_date : string option;
    company : string;
    company_logo : string;
  }
  [@@deriving of_yaml, show]
end

module Testimonial = struct
  type t = {
    person : string;
    testimony : string;
    href : string;
    role : string;
    logo : string;
  }
  [@@deriving of_yaml, show]
end

module News = struct
  type t = {
    title : string;
    description : string;
    date : string;
    slug : string;
    tags : string list;
    body_html : string;
    authors : string list;
  }
  [@@deriving show]
end

module Opam_user = struct
  type t = {
    name : string;
    email : string option;
    github_username : string option;
    avatar : string option;
  }
  [@@deriving of_yaml, show]
end

module Page = struct
  type t = {
    slug : string;
    title : string;
    description : string;
    meta_title : string;
    meta_description : string;
    body_md : string;
    body_html : string;
  }
  [@@deriving show]
end

module Paper = struct
  type link = { description : string; uri : string } [@@deriving of_yaml, show]

  module Record = struct
  type t = {
    title : string;
    slug : string;
    container_title: string option;
    collection_title: string option;
    publication : string option;
    authors : string list;
    author : string list;
    editors : string list;
    abstract : string;
    tags : string list;
    keyword : string option;
    year : int option;
    links : link list;
    doi: string option;
    url: string option;
    id : string option;
    featured : bool;
    issue : int option;
    volume : int option;
    issued : int option;
    publisher: string option;
    page: string option;
    type_: string option;
    note: string option;
  }
  [@@deriving show]
  end

  type t = {
    title : string;
    slug : string;
    publication : string;
    authors : string list;
    abstract : string;
    tags : string list;
    year : int;
    links : link list;
    featured : bool;
    type_: string;
    note : string option;
  }
  [@@deriving show]

  let record_to_t r = 
    let authors = r.Record.authors @ r.Record.author in
    let publication = 
      let pub =
        match r.Record.publication with
        | Some pub -> pub
        | None -> 
          match r.Record.container_title with
          | None -> 
            (match r.Record.publisher with
            | Some pub -> pub
            | None -> raise (Invalid_argument "Yaml record does not contain any of the publication, publisher or container_title fields" ))
          | Some pub -> pub
      in 
      pub
      ^ Option.fold ~none:"" ~some:(fun p -> ", Issue " ^ string_of_int p) r.Record.issue
      ^ Option.fold ~none:"" ~some:(fun p -> ", Volume " ^ string_of_int p) r.Record.volume
      ^ Option.fold ~none:"" ~some:(fun p -> ": " ^ p) r.Record.page
    in
    let year = 
      match r.Record.year with
      | Some i -> i 
      | None -> 
        match r.Record.issued with
        | None -> raise (Invalid_argument "Yaml record does not contain any of the year or issued fields" )
        | Some i -> i        
    in
    let links = 
      match r.Record.doi with
      | Some doi -> 
        { description = "DOI"; uri = "https://dx.doi.org/" ^ doi} :: r.Record.links
      | None -> r.Record.links
    in
    let links = 
      match r.Record.url with
      | Some url -> 
        { description = "URL"; uri = url } :: links
      | None -> links
    in
    let tags = r.Record.tags @ (Option.fold ~none:[] ~some:(String.split_on_char ',') r.Record.keyword) in
    { title = r.Record.title;
      slug = r.Record.slug;
      note = r.Record.note;
      publication;
      authors;
      abstract = r.Record.abstract;
      tags;
      year;
      links;
      featured = r.Record.featured;
      type_ = Option.value r.Record.type_ ~default:"article"
    }

end

module Release = struct
  type kind = [ `Compiler | `Coq | `Rocq | `CoqPlatform | `RocqPlatform ] [@@deriving show]

  let kind_of_string = function
    | "compiler" -> Ok `Compiler
    | "coq" -> Ok `Coq
    | "rocq" -> Ok `Rocq
    | "coq-platform" -> Ok `CoqPlatform
    | "rocq-platform" -> Ok `RocqPlatform
    | s -> Error (`Msg ("Unknown release type: " ^ s))

  let kind_of_yaml = function
    | `String s -> kind_of_string s
    | _ -> Error (`Msg "Expected a string for release type")

  let package_of_kind = function
  | `Compiler -> "ocaml"
  | `Coq -> "coq"
  | `Rocq -> "rocq-prover"
  | `CoqPlatform -> "coq-platform"
  | `RocqPlatform -> "rocq-platform"

  let name_of_kind = function
  | `Compiler -> "OCaml"
  | `Coq -> "Coq"
  | `Rocq -> "Rocq Prover"
  | `CoqPlatform -> "Coq Platform"
  | `RocqPlatform -> "Rocq Platform"

  let id x = x
  let github_of_kind = function 
  | `Compiler -> "https://github.com/ocaml/ocaml", id
  | `Coq -> "https://github.com/rocq-prover/rocq", (fun x -> "V" ^ x)
  | `Rocq -> "https://github.com/rocq-prover/rocq", (fun x -> "V" ^ x)
  | `CoqPlatform -> "https://github.com/rocq-prover/platform", id
  | `RocqPlatform -> "https://github.com/rocq-prover/platform", id

  type t = {
    kind : kind;
    version : string;
    date : string;
    is_latest : bool;
    is_prerelease : bool;
    is_lts : bool;
    intro_md : string;
    intro_html : string;
    highlights_md : string;
    highlights_html : string;
    body_md : string;
    body_html : string;
  }
  [@@deriving show]

  let github_release release =
    let url, v = github_of_kind release.kind in
    url ^ "/releases/tag/" ^ v release.version


end

module Resource = struct
  type t = {
    title : string;
    description : string;
    image : string;
    online_url : string;
    source_url : string option;
    featured : bool;
  }
  [@@deriving of_yaml, show]
end

module Success_story = struct
  type t = {
    title : string;
    slug : string;
    logo : string;
    background : string;
    theme : string;
    synopsis : string;
    url : string;
    why_ocaml_reasons : string list option;
    priority : int;
    body_md : string;
    body_html : string;
  }
  [@@deriving show]
end

module Tool = struct
  type lifecycle = [ `Base | `Extended | `Full | `Ide | `Optional | `Dependency ]
  [@@deriving show]

  let lifecycle_of_string = function
    | "base" -> Ok `Base
    | "extended" -> Ok `Extended
    | "full" -> Ok `Full
    | "ide" -> Ok `Ide
    | "optional" -> Ok `Optional
    | "dependency" -> Ok `Dependency
    | s -> Error (`Msg ("Unknown lifecycle type: " ^ s))

  let lifecycle_of_yaml = function
    | `String s -> lifecycle_of_string s
    | _ -> Error (`Msg "Expected a string for lifecycle type")

  type t = {
    name : string;
    slug : string;
    source : string;
    license : string;
    synopsis : string;
    description : string;
    lifecycle : lifecycle;
  }
  [@@deriving show]
end

module Tool_page = struct
  type toc = { title : string; href : string; children : toc list }
  [@@deriving of_yaml, show]

  type contribute_link = { url : string; description : string }
  [@@deriving of_yaml, show]

  type t = {
    title : string;
    short_title : string;
    fpath : string;
    slug : string;
    description : string;
    category : string;
    body_md : string;
    toc : toc list;
    body_html : string;
  }
  [@@deriving show]
end

module Consortium_page = struct
  type toc = { title : string; href : string; children : toc list }
  [@@deriving of_yaml, show]

  type contribute_link = { url : string; description : string }
  [@@deriving of_yaml, show]

  type t = {
    title : string;
    short_title : string;
    fpath : string;
    slug : string;
    description : string;
    category : string;
    body_md : string;
    toc : toc list;
    body_html : string;
  }
  [@@deriving show]
end

module Roadmap = struct
  type toc = { title : string; href : string; children : toc list }
  [@@deriving show]

  type t = {
    fpath : string;
    body_md : string;
    toc : toc list;
    body_html : string;
  }
  [@@deriving show]
end

module Tutorial = struct
  module Section = struct
    type t = Platform | Guides [@@deriving show]

    let of_string = function
      | "platform" -> Ok Platform
      | "guides" -> Ok Guides
      | s -> Error (`Msg ("Unknown section: " ^ s))
  end

  type toc = { title : string; href : string; children : toc list }
  [@@deriving show]

  type contribute_link = { url : string; description : string }
  [@@deriving of_yaml, show]

  type banner = { image : string; url : string; alt : string }
  [@@deriving of_yaml, show]

  type external_tutorial = {
    tag : string;
    banner : banner;
    contribute_link : contribute_link;
  }
  [@@deriving of_yaml, show]

  type recommended_next_tutorials = string list [@@deriving of_yaml, show]
  type prerequisite_tutorials = string list [@@deriving of_yaml, show]

  type search_document_section = { title : string; id : string }
  [@@deriving show]

  type search_document = {
    title : string;
    category : string;
    section : search_document_section option;
    content : string;
    slug : string;
  }
  [@@deriving show]

  type t = {
    title : string;
    short_title : string;
    fpath : string;
    slug : string;
    description : string;
    section : Section.t;
    category : string;
    external_tutorial : external_tutorial option;
    body_md : string;
    toc : toc list;
    body_html : string;
    recommended_next_tutorials : recommended_next_tutorials;
    prerequisite_tutorials : prerequisite_tutorials;
  }
  [@@deriving show]
end

module Video = struct
  type t = {
    title : string;
    url : string;
    thumbnail : string;
    description : string; [@default ""]
    published : string;
    author_name : string;
    author_uri : string;
    source_link : string;
    source_title : string;
  }
  [@@deriving yaml, show]
end

module Conference = struct
  type role = [ `Co_chair | `Chair ] [@@deriving show]

  let role_of_string = function
    | "chair" -> Ok `Chair
    | "co-chair" -> Ok `Co_chair
    | s -> Error (`Msg ("Unknown role type: " ^ s))

  let role_of_yaml = function
    | `String s -> role_of_string s
    | _ -> Error (`Msg "Expected a string for role type")

  type important_date = { date : string; info : string }
  [@@deriving of_yaml, show]

  type committee_member = {
    name : string;
    role : role option;
    affiliation : string option;
    picture : string option;
  }
  [@@deriving of_yaml, show]

  type presentation = {
    title : string;
    authors : string list;
    link : string option;
    video : string option;
    slides : string option;
    poster : bool;
    additional_links : string list;
  }
  [@@deriving of_yaml, show]

  type t = {
    title : string;
    slug : string;
    location : string;
    date : string;
    important_dates : important_date list;
    presentations : presentation list;
    program_committee : committee_member list;
    organising_committee : committee_member list;
    body_md : string;
    body_html : string;
  }
  [@@deriving of_yaml, show]
end

(* Depends on Video and Blog modules to define the different kinds of entries of
   the OCaml Planet *)
module Planet = struct
  type entry = BlogPost of Blog.Post.t | Video of Video.t [@@deriving show]

  let date_of_post = function
    | BlogPost { date; _ } -> date
    | Video { published; _ } -> published
end
