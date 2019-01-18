defmodule Appman.Teams.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appman.Users.User
  alias Appman.Teams.Team

  @primary_key false
  @foreign_key_type :binary_id
  @timestamps_opts type: :utc_datetime
  schema "team_members" do
    belongs_to :user, User, primary_key: true
    belongs_to :team, Team, primary_key: true
    field :role, :string

    timestamps updated_at: false
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:role, :user_id, :team_id])
    |> validate_required([:role, :user_id, :team_id])
  end
end
