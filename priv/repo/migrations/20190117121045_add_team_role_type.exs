defmodule Appman.Repo.Migrations.AddTeamRoleType do
  use Ecto.Migration

  alias Appman.Teams.MemberRole

  def up do
    MemberRole.create_type()
  end

  def down do
    MemberRole.drop_type()
  end
end
