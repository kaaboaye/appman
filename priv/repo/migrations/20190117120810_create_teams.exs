defmodule Appman.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :access_type, :teams_access_type, null: false, default: "public"

      timestamps updated_at: false
    end
  end
end
