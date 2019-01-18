defmodule AppmanWeb.FallbackController do
  use AppmanWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(AppmanWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(:bad_request)
    |> render(AppmanWeb.ErrorView, :"400")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> render(AppmanWeb.ErrorView, :"401")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(AppmanWeb.ErrorView, :"404")
  end
end
