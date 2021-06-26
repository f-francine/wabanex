defmodule Wabanex.Repo.Migrations.CreateExercisesTable do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add(:name, :string)
      add(:protocol_description, :string)
      add(:repetitions, :string)
      add(:youtube_video_url, :string)
      add(:trainings_id, references(:trainings))
    end
  end
end
