defmodule Wabanex.Model.Users do
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields [:name, :email, :nickname, :password]
  @optional_fields []

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:nickname, :string)
    field(:password, :string)

    timestamps()
  end

  def changeset(data \\ %__MODULE__{}, params) do
    data
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:email])
    |> unique_constraint([:nickname])
  end
end
