defmodule Appman.Repo.Migrations.CreateTeamsAccessType do
  use Ecto.Migration

  alias Appman.Teams.AccessType

  def up do
    AccessType.create_type()
  end

  def down do
    AccessType.drop_type()
  end
end
