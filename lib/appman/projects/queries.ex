defmodule Appman.Projects.Queries do
  import Ecto.Query

  alias Appman.Projects.{Project, Environment}

  def team_projects(team_id) do
    from p in Project, where: p.team_id == ^team_id
  end

  def public_project_environments(project_id) do
    from e in Environment,
      join: p in Project,
      on: e.project_id == p.id,
      where: p.access_type == "public" and p.id == ^project_id
  end
end
