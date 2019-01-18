defmodule Appman.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appman.Teams.Team
  alias Appman.Projects.AccessType

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts type: :utc_datetime
  schema "projects" do
    belongs_to :team, Team
    field :last_build_no, :integer
    field :name, :string
    field :access_type, AccessType
    field :meta, :map, default: %{}

    timestamps updated_at: false
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :last_build_no, :team_id, :access_type, :meta])
    |> validate_required([:name, :last_build_no, :team_id, :access_type, :meta])
  end
end
