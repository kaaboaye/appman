defmodule Appman.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :team_id, references(:teams, on_delete: :nothing, type: :binary_id), null: false
      add :name, :string, null: false
      add :last_build_no, :integer, null: false, default: 0
      add :access_type, :projects_access_type, null: false, default: "public"
      add :meta, :map, null: false, default: "{}"

      timestamps updated_at: false
    end

    create index(:projects, [:team_id])
  end
end
