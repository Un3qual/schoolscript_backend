defmodule SchoolScript.PharmacyTest do
  use SchoolScript.DataCase

  alias SchoolScript.Pharmacy

  describe "medications" do
    alias SchoolScript.Pharmacy.Medication

    import SchoolScript.PharmacyFixtures

    @invalid_attrs %{written_name: nil, brand_name: nil, generic_name: nil, dose: nil, dea_schedule: nil}

    test "list_medications/0 returns all medications" do
      medication = medication_fixture()
      assert Pharmacy.list_medications() == [medication]
    end

    test "get_medication!/1 returns the medication with given id" do
      medication = medication_fixture()
      assert Pharmacy.get_medication!(medication.id) == medication
    end

    test "create_medication/1 with valid data creates a medication" do
      valid_attrs = %{written_name: "some written_name", brand_name: "some brand_name", generic_name: "some generic_name", dose: "some dose", dea_schedule: 42}

      assert {:ok, %Medication{} = medication} = Pharmacy.create_medication(valid_attrs)
      assert medication.written_name == "some written_name"
      assert medication.brand_name == "some brand_name"
      assert medication.generic_name == "some generic_name"
      assert medication.dose == "some dose"
      assert medication.dea_schedule == 42
    end

    test "create_medication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pharmacy.create_medication(@invalid_attrs)
    end

    test "update_medication/2 with valid data updates the medication" do
      medication = medication_fixture()
      update_attrs = %{written_name: "some updated written_name", brand_name: "some updated brand_name", generic_name: "some updated generic_name", dose: "some updated dose", dea_schedule: 43}

      assert {:ok, %Medication{} = medication} = Pharmacy.update_medication(medication, update_attrs)
      assert medication.written_name == "some updated written_name"
      assert medication.brand_name == "some updated brand_name"
      assert medication.generic_name == "some updated generic_name"
      assert medication.dose == "some updated dose"
      assert medication.dea_schedule == 43
    end

    test "update_medication/2 with invalid data returns error changeset" do
      medication = medication_fixture()
      assert {:error, %Ecto.Changeset{}} = Pharmacy.update_medication(medication, @invalid_attrs)
      assert medication == Pharmacy.get_medication!(medication.id)
    end

    test "delete_medication/1 deletes the medication" do
      medication = medication_fixture()
      assert {:ok, %Medication{}} = Pharmacy.delete_medication(medication)
      assert_raise Ecto.NoResultsError, fn -> Pharmacy.get_medication!(medication.id) end
    end

    test "change_medication/1 returns a medication changeset" do
      medication = medication_fixture()
      assert %Ecto.Changeset{} = Pharmacy.change_medication(medication)
    end
  end

  describe "prescriptions" do
    alias SchoolScript.Pharmacy.Prescription

    import SchoolScript.PharmacyFixtures

    @invalid_attrs %{days_supply: nil, is_refill: nil, refills_remaining: nil, prescribing_doctor_name: nil, prescribed_quantity: nil, rx_number: nil, truepill_token: nil, medication_sig: nil}

    test "list_prescriptions/0 returns all prescriptions" do
      prescription = prescription_fixture()
      assert Pharmacy.list_prescriptions() == [prescription]
    end

    test "get_prescription!/1 returns the prescription with given id" do
      prescription = prescription_fixture()
      assert Pharmacy.get_prescription!(prescription.id) == prescription
    end

    test "create_prescription/1 with valid data creates a prescription" do
      valid_attrs = %{days_supply: 42, is_refill: true, refills_remaining: 42, prescribing_doctor_name: "some prescribing_doctor_name", prescribed_quantity: 42, rx_number: "some rx_number", truepill_token: "some truepill_token", medication_sig: "some medication_sig"}

      assert {:ok, %Prescription{} = prescription} = Pharmacy.create_prescription(valid_attrs)
      assert prescription.days_supply == 42
      assert prescription.is_refill == true
      assert prescription.refills_remaining == 42
      assert prescription.prescribing_doctor_name == "some prescribing_doctor_name"
      assert prescription.prescribed_quantity == 42
      assert prescription.rx_number == "some rx_number"
      assert prescription.truepill_token == "some truepill_token"
      assert prescription.medication_sig == "some medication_sig"
    end

    test "create_prescription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pharmacy.create_prescription(@invalid_attrs)
    end

    test "update_prescription/2 with valid data updates the prescription" do
      prescription = prescription_fixture()
      update_attrs = %{days_supply: 43, is_refill: false, refills_remaining: 43, prescribing_doctor_name: "some updated prescribing_doctor_name", prescribed_quantity: 43, rx_number: "some updated rx_number", truepill_token: "some updated truepill_token", medication_sig: "some updated medication_sig"}

      assert {:ok, %Prescription{} = prescription} = Pharmacy.update_prescription(prescription, update_attrs)
      assert prescription.days_supply == 43
      assert prescription.is_refill == false
      assert prescription.refills_remaining == 43
      assert prescription.prescribing_doctor_name == "some updated prescribing_doctor_name"
      assert prescription.prescribed_quantity == 43
      assert prescription.rx_number == "some updated rx_number"
      assert prescription.truepill_token == "some updated truepill_token"
      assert prescription.medication_sig == "some updated medication_sig"
    end

    test "update_prescription/2 with invalid data returns error changeset" do
      prescription = prescription_fixture()
      assert {:error, %Ecto.Changeset{}} = Pharmacy.update_prescription(prescription, @invalid_attrs)
      assert prescription == Pharmacy.get_prescription!(prescription.id)
    end

    test "delete_prescription/1 deletes the prescription" do
      prescription = prescription_fixture()
      assert {:ok, %Prescription{}} = Pharmacy.delete_prescription(prescription)
      assert_raise Ecto.NoResultsError, fn -> Pharmacy.get_prescription!(prescription.id) end
    end

    test "change_prescription/1 returns a prescription changeset" do
      prescription = prescription_fixture()
      assert %Ecto.Changeset{} = Pharmacy.change_prescription(prescription)
    end
  end
end
