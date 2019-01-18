defmodule Appman.Projects.Environment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appman.Projects.Project

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts type: :utc_datetime
  schema "projects_environments" do
    belongs_to :project, Project
    field :name, :string
    field :url, :string
    field :meta, :map, default: %{}

    timestamps()
  end

  @doc false
  def changeset(environment, attrs) do
    environment
    |> cast(attrs, [:name, :url, :project_id, :meta])
    |> validate_required([:name, :url, :project_id, :meta])
    |> unique_constraint(:name, name: :projects_environments_project_id_name_index)
  end
end
