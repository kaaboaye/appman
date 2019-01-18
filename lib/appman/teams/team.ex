defmodule Appman.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appman.Teams.AccessType

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts type: :utc_datetime
  schema "teams" do
    field :name, :string
    field :access_type, AccessType

    timestamps updated_at: false
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :access_type])
    |> validate_required([:name, :access_type])
  end
end
