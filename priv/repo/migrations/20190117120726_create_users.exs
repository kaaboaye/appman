defmodule Appman.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string, null: false
      add :password, :string, null: false

      timestamps updated_at: false
    end

    create index(:users, [:username])
  end
end
