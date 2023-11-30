defmodule SchoolScript.Pharmacy.Medication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medications" do
    field :written_name, :string
    field :brand_name, :string
    field :generic_name, :string
    field :dose, :string
    field :dea_schedule, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(medication, attrs) do
    medication
    |> cast(attrs, [:written_name, :brand_name, :generic_name, :dose, :dea_schedule])
    |> validate_required([:written_name, :brand_name, :generic_name, :dose, :dea_schedule])
  end
end
