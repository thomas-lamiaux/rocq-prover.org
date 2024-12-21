open Data_intf.Release

type metadata = {
  kind : kind;
  version : string;
  date : string;
  is_latest : bool option;
  is_lts : bool option;
  intro : string;
  highlights : string;
}
[@@deriving
  of_yaml,
    stable_record ~version:t ~remove:[ intro; highlights ]
      ~modify:[ is_latest; is_lts ]
      ~add:
        [
          intro_md;
          intro_html;
          highlights_md;
          highlights_html;
          body_md;
          body_html;
        ]]

let of_metadata m =
  metadata_to_t m ~intro_md:m.intro
    ~intro_html:
      (m.intro |> Markdown.Content.of_string |> Markdown.Content.render)
    ~highlights_md:m.highlights
    ~highlights_html:
      (m.highlights |> Markdown.Content.of_string
      |> Markdown.Content.render ~syntax_highlighting:true)
    ~modify_is_latest:(Option.value ~default:false)
    ~modify_is_lts:(Option.value ~default:false)

let sort_by_decreasing_version (x : t) (y : t) =
  let to_list s = List.map int_of_string_opt @@ String.split_on_char '.' s in
  compare (to_list y.version) (to_list x.version)

let decode (fpath, (head, body_md)) =
  let metadata =
    metadata_of_yaml head |> Result.map_error (Utils.where fpath)
  in
  let body_html =
    body_md |> Markdown.Content.of_string
    |> Markdown.Content.render ~syntax_highlighting:true
  in
  Result.map (of_metadata ~body_md ~body_html) metadata

let all () =
  Utils.map_md_files decode "releases/*.md"
  |> List.sort sort_by_decreasing_version

let is_coq_or_rocq (r : t) = r.kind == `Coq || r.kind == `Rocq
let is_coq_or_rocq_platform (r : t) = r.kind == `CoqPlatform || r.kind == `RocqPlatform

let template () =
  let all = all () in
  let latest =
    try List.find (fun (r : t) -> is_coq_or_rocq r && r.is_latest) all
    with Not_found ->
      raise
        (Invalid_argument
           "none of the Coq/Rocq releases in data/releases is marked with is_latest: \
            true")
  in
  let latest_platform =
    try List.find (fun (r : t) -> is_coq_or_rocq_platform r && r.is_latest) all
    with Not_found ->
      raise
        (Invalid_argument
           "none of the Coq/Rocq Platform releases in data/releases is marked with is_latest: \
            true")
  in
  let lts =
    try List.find (fun (r : t) -> r.is_lts) all
    with Not_found ->
      raise
        (Invalid_argument
           "none of the releases in data/releases is marked with is_lts: true")
  in
  Format.asprintf
    {|
include Data_intf.Release
let all = %a
let latest = %a
let latest_platform = %a
let lts = %a
|}
    (Fmt.brackets (Fmt.list pp ~sep:Fmt.semi))
    all pp latest pp latest_platform pp lts
