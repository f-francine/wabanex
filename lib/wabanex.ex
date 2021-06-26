defmodule Wabanex do
  alias  Wabanex.Users.User
  alias Wabanex.Trainings.Training

  @spec create_user(params :: any()) :: {:ok, struct} | {:error, :invalid_params}
  defdelegate create_user(params), to:  User, as: :create_user

  @spec get_user(user_id :: Ecto.UUID.t) :: {:ok, Users.t()} | {:error, :not_found}
  defdelegate get_user(user_id), to: User, as: :get_user

  @spec create_training(params :: any()) :: {:ok, Training.t} | {:error, Ecto.Changeset.t}
  defdelegate create_training(params), to: Training, as: :create_training

end
