alias Appman.Repo

alias Appman.Users.User
alias Appman.Teams.{Team, TeamMember}
alias Appman.Projects.{Project, Environment}

%{id: user_id} =
  %User{
    username: "wojtek",
    password: "wojtek12"
  }
  |> Repo.insert!()

%{id: team_id} =
  %Team{
    name: "Alpak"
  }
  |> Repo.insert!()

%TeamMember{
  user_id: user_id,
  team_id: team_id,
  role: "admin"
}
|> Repo.insert!()

%{id: project_id} =
  %Project{
    team_id: team_id,
    name: "Appman"
  }
  |> Repo.insert!()

[
  %Environment{
    project_id: project_id,
    name: "dev",
    url: "http://0:4000"
  },
  %Environment{
    project_id: project_id,
    name: "stage",
    url: "https://stage.herokuapp.com"
  }
]
|> Enum.each(&Repo.insert!/1)
