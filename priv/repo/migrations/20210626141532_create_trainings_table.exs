defmodule Wabanex.Repo.Migrations.CreateTrainingsTable do
  use Ecto.Migration

  def change do
    create table(:trainings) do
      add(:name, :string)
      add(:start_at, :date)
      add(:finish_at, :date)

      # Each trainning is related to an user, so thats why we have to reference the users table here
      add(:user_id, references(:user))

      timestamps()
    end
  end
end
