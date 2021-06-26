defmodule Wabanex.Trainings.Model.Training do
  use Ecto.Schema

  alias Wabanex.Users.Model.Users
  alias Wabanex.Exercises.Model.Exercise
  import Ecto.Changeset

  @required_fields [:name, :start_at, :finish_at, :user_id]
  @optional_fields []

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "trainings" do
    field(:name, :string)
    field(:start_at, :date)
    field(:finish_at, :date)

    belongs_to(:user, Users)
    has_many(:exercises, Exercise)

    timestamps()
  end

  def changeset(data \\ %__MODULE__{}, params) do
    data
    |> cast(params, @required_fields ++ @optional_fields)
    |> cast_assoc(:exercises)
  end
end
