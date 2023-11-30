defmodule SchoolScript.Repo.Migrations.CreatePrescriptions do
  use Ecto.Migration

  def change do
    create table(:prescriptions) do
      add :days_supply, :integer, null: false
      add :is_refill, :boolean, default: false, null: false
      add :refills_remaining, :integer, null: false, default: 0
      add :prescribing_doctor_name, :string, null: false
      add :prescribed_quantity, :integer, null: false
      add :rx_number, :string, null: false
      add :truepill_token, :string
      add :medication_sig, :string
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :medication_id, references(:medications, on_delete: :nothing), null: false

      timestamps(type: :utc_datetime_usec)
    end

    create index(:prescriptions, [:user_id])
    create index(:prescriptions, [:medication_id])
  end
end
