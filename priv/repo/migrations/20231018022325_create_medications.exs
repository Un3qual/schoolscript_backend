defmodule SchoolScript.Repo.Migrations.CreateMedications do
  use Ecto.Migration

  def change do
    create table(:medications) do
      add :written_name, :string, null: false
      add :brand_name, :string, null: false
      add :generic_name, :string, null: false
      add :dose, :string, null: false
      add :dea_schedule, :integer, null: false, default: 0

      timestamps(type: :utc_datetime_usec)
    end
  end
end
