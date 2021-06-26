defmodule Wabanex.Trainings.Training do
  alias Wabanex.Repo
  alias Wabanex.Trainings.Model.Training

  @spec create_training(params :: any()) :: {:ok, Training.t} | {:error, Ecto.Changeset.t}
  def create_training(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
