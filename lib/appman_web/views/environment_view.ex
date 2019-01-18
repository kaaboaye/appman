defmodule AppmanWeb.EnvironmentView do
  use AppmanWeb, :view

  alias AppmanWeb.EnvironmentView

  def render("index.json", %{environments: envs}) do
    %{data: render_many(envs, EnvironmentView, "environment.json")}
  end

  def render("environment.json", %{environment: env}) do
    %{
      id: env.id,
      name: env.name,
      url: env.url,
      project_id: env.project_id,
      meta: env.meta,
      updated_at: env.updated_at,
      inserted_at: env.inserted_at
    }
  end
end
