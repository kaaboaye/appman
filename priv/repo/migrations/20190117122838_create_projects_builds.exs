defmodule Appman.Repo.Migrations.CreateProjectsBuilds do
  use Ecto.Migration

  def change do
    create table(:projects_builds, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :build_no, :integer, null: false
      add :device_username, :string
      add :device_operating_system, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      add :project_environment_id,
          references(:projects_environments, on_delete: :nothing, type: :binary_id),
          null: false

      timestamps updated_at: false
    end

    create index(:projects_builds, [:project_environment_id])
    create index(:projects_builds, [:user_id])
  end
end
