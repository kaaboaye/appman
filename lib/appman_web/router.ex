defmodule AppmanWeb.Router do
  use AppmanWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppmanWeb do
    pipe_through :api

    get "/projects/:id/environments", EnvironmentController, :index
  end
end
