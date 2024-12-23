# Retrieving data

## GitHub teams

To generate the `github_teams.json` file, run the following GraphQL query (for instance in the [GitHub GraphQL Explorer](https://developer.github.com/v4/explorer/)):

```graphql
query {
  organization(login: "coq") {
    teams(first: 100) {
      totalCount
      nodes {
        slug
        name
        description
        members {
          nodes { login name }
        }
      }
    }
  }
}
```

To generate the `github_teams_simplified.json` file, run the following `jq` command (at the root of the repository):

```bash
jq '{
  teams: .data.organization.teams.nodes | map({
    id: .slug,
    name: .name,
    description: .description,
    contacts: [],
    members: .members.nodes | map({github: .login, role: "Member", name: (.name // "")})
  }),
  "working-groups": []
}' data/github-teams.json > data/github-teams-simplified.json
```