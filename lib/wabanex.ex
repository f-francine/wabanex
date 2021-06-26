defmodule Wabanex do
  alias Wabanex.Repo
  alias Wabanex.Model.Users

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

  @spec get_user(params :: any()) :: {:ok, Users.t()} | {:error, :not_found}
  def get_user(user_id) do
    User
    |> Repo.get(user_id)
    |> case do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
