defmodule Wabanex.Exercises.Model.Exercise do
  use Ecto.Schema

  alias Wabanex.Trainings.Model.Training

  import Ecto.Changeset

  @required_fields [:name, :protocol_description, :repetitions, :youtube_video_url]
  @optional_fields []

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "exercises" do
    field(:name, :string)
    field(:protocol_description, :string)
    field(:repetitions, :string)
    field(:youtube_video_url, :string)

    belongs_to(:trainings, Training)

    timestamps()
  end

  def changeset(data \\ %__MODULE__{}, params) do
    data
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
