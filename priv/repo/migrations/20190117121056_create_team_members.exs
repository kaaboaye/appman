defmodule Appman.Repo.Migrations.CreateTeamMembers do
  use Ecto.Migration

  def change do
    create table(:team_members, primary_key: false) do
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id),
        primary_key: true,
        null: false

      add :team_id, references(:teams, on_delete: :nothing, type: :binary_id),
        primary_key: true,
        null: false

      add :role, :teams_member_role, null: false
      timestamps updated_at: false
    end

    create index(:team_members, [:user_id])
    create index(:team_members, [:team_id])
  end
end
