defmodule SchoolScript.PharmacyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SchoolScript.Pharmacy` context.
  """

  @doc """
  Generate a medication.
  """
  def medication_fixture(attrs \\ %{}) do
    {:ok, medication} =
      attrs
      |> Enum.into(%{
        brand_name: "some brand_name",
        dea_schedule: 42,
        dose: "some dose",
        generic_name: "some generic_name",
        written_name: "some written_name"
      })
      |> SchoolScript.Pharmacy.create_medication()

    medication
  end

  @doc """
  Generate a prescription.
  """
  def prescription_fixture(attrs \\ %{}) do
    {:ok, prescription} =
      attrs
      |> Enum.into(%{
        days_supply: 42,
        is_refill: true,
        medication_sig: "some medication_sig",
        prescribed_quantity: 42,
        prescribing_doctor_name: "some prescribing_doctor_name",
        refills_remaining: 42,
        rx_number: "some rx_number",
        truepill_token: "some truepill_token"
      })
      |> SchoolScript.Pharmacy.create_prescription()

    prescription
  end
end
