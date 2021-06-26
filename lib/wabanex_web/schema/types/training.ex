defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types(WabanexWeb.Schema.Types.Exercise)

  @desc "Logic training representation"
  object(:trainings) do
    field(:id, non_null(:uuid4))
    field(:name, non_null(:string))
    field(:start_at, non_null(:string))
    field(:finish_at, non_null(:string))
    field(:exercises, list_of(:exercise))
  end

  input_object :create_training_input do
    field(:user_id, non_null(:uuid4))
    field(:name, non_null(:string))
    field(:start_at, non_null(:string))
    field(:finish_at, non_null(:string))
    field(:exercises, list_of(:create_exercise_input))
  end
end
