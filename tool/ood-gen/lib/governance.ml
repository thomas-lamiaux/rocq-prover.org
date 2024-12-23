open Ocamlorg.Import
open Data_intf.Governance

type metadata = {
  teams : team list;
  working_groups : team list; [@key "working-groups"]
}
[@@deriving of_yaml]

let teams file =
  let file = file in
  let result =
    let ( let* ) = Result.bind in
    let* yaml = Utils.yaml_file file in
    metadata_of_yaml yaml
  in
  result
  |> Result.map_error (Utils.where file)
  |> Result.get_ok ~error:(fun (`Msg msg) -> Exn.Decode_error msg)

let template () =
  let governance = teams "governance.yml" in
  let github_teams = teams "github-teams-simplified.json" in
  Format.asprintf
    {|
include Data_intf.Governance
let teams = %a

let working_groups = %a
|}
    (Fmt.brackets (Fmt.list pp_team ~sep:Fmt.semi))
    github_teams.teams
    (Fmt.brackets (Fmt.list pp_team ~sep:Fmt.semi))
    governance.working_groups
