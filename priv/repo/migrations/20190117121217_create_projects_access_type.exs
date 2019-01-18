defmodule Appman.Repo.Migrations.CreateProjectsAccessType do
  use Ecto.Migration

  alias Appman.Projects.AccessType

  def up do
    AccessType.create_type()
  end

  def down do
    AccessType.drop_type()
  end
end
