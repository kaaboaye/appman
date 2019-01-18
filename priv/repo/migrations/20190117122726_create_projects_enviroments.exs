defmodule Appman.Repo.Migrations.CreateProjectsEnviroments do
  use Ecto.Migration

  def change do
    create table(:projects_environments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id), null: false

      add :name, :string, null: false
      add :url, :text, null: false
      add :meta, :map, null: false, default: "{}"

      timestamps()
    end

    create index(:projects_environments, [:project_id])
    create unique_index(:projects_environments, [:project_id, :name])
  end
end
