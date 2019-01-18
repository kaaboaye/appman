defmodule Appman.Projects do
  alias Appman.Repo

  alias Appman.Projects.{Queries, Project}

  def get_project(project_id) do
    Repo.get(Project, project_id) || {:error, :not_found}
  end

  def get_team_projects(team_id) do
    team_id
    |> Queries.team_projects()
    |> Repo.all()
  end

  def get_public_project_environments(project_id) do
    project_id
    |> Queries.public_project_environments()
    |> Repo.all()
  end
end
