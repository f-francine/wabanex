defmodule Wabanex.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add(:name, :string)
      add(:email, :string)
      add(:nickname, :string)
      add(:password, :string)

      timestamps()
    end

    create unique_index(:users, [:email, :nickname])
  end
end
