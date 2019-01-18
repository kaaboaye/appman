defmodule AppmanWeb.EnvironmentController do
  use AppmanWeb, :controller

  alias Appman.Projects

  action_fallback(AppmanWeb.FallbackController)

  def index(conn, %{"id" => project_id}) do
    envs = Projects.get_public_project_environments(project_id)

    render(conn, "index.json", environments: envs)
  end
end
