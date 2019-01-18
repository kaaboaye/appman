defmodule Appman.Projects.Build do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appman.Users.User
  alias Appman.Projects.Environment

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts type: :utc_datetime
  schema "projects_builds" do
    field :build_no, :integer
    field :device_username, :string
    field :device_operating_system, :string
    belongs_to :user, User
    belongs_to :environment, Environment

    timestamps updated_at: false
  end

  @doc false
  def changeset(build, attrs) do
    build
    |> cast(attrs, [
      :build_no,
      :device_username,
      :device_operating_system,
      :user_id,
      :project_environment_id
    ])
    |> validate_required([:build_no])
  end
end
