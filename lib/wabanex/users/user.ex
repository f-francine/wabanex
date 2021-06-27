defmodule Wabanex.Users.User do
  alias Wabanex.Repo
  alias Wabanex.Trainings.Model.Training
  alias Wabanex.Users.Model.Users

  @spec create_user(params :: any()) :: {:ok, struct} | {:error, :invalid_params}
  def create_user(params) do
    params
    |> Users.changeset()
    |> Repo.insert()
    |> case do
      {:ok, struct} -> {:ok, struct}
      {:error, _changeset} -> {:error, :invalid_params}
    end
  end

  @spec get_user(user_id :: Ecto.UUID.t()) :: {:ok, Users.t()} | {:error, :not_found}
  def get_user(user_id) do
    User
    |> Repo.get(user_id)
    |> case do
      nil -> {:error, :not_found}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    query =
      from t in Training,
        where:
          ^today >= t.start_at and
            ^today <= t.finish_at

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
