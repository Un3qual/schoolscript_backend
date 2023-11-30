defmodule SchoolScript.Pharmacy.Prescription do
  use Ecto.Schema
  import Ecto.Changeset

  alias SchoolScript.{Accounts, Pharmacy}

  schema "prescriptions" do
    field :days_supply, :integer
    field :is_refill, :boolean, default: false
    field :refills_remaining, :integer
    field :prescribing_doctor_name, :string
    field :prescribed_quantity, :integer
    field :rx_number, :string
    field :truepill_token, :string
    field :medication_sig, :string

    timestamps(type: :utc_datetime)

    belongs_to :user, Accounts.User
    belongs_to :medication, Pharmacy.Medication
  end

  @doc false
  def changeset(prescription, attrs) do
    prescription
    |> cast(attrs, [:days_supply, :is_refill, :refills_remaining, :prescribing_doctor_name, :prescribed_quantity, :rx_number, :truepill_token, :medication_sig])
    |> validate_required([:days_supply, :is_refill, :refills_remaining, :prescribing_doctor_name, :prescribed_quantity, :rx_number, :truepill_token, :medication_sig])
  end
end
