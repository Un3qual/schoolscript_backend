defmodule SchoolScriptWeb.PrescriptionControllerTest do
  use SchoolScriptWeb.ConnCase

  import SchoolScript.PharmacyFixtures

  @create_attrs %{days_supply: 42, is_refill: true, refills_remaining: 42, prescribing_doctor_name: "some prescribing_doctor_name", prescribed_quantity: 42, rx_number: "some rx_number", truepill_token: "some truepill_token", medication_sig: "some medication_sig"}
  @update_attrs %{days_supply: 43, is_refill: false, refills_remaining: 43, prescribing_doctor_name: "some updated prescribing_doctor_name", prescribed_quantity: 43, rx_number: "some updated rx_number", truepill_token: "some updated truepill_token", medication_sig: "some updated medication_sig"}
  @invalid_attrs %{days_supply: nil, is_refill: nil, refills_remaining: nil, prescribing_doctor_name: nil, prescribed_quantity: nil, rx_number: nil, truepill_token: nil, medication_sig: nil}

  describe "index" do
    test "lists all prescriptions", %{conn: conn} do
      conn = get(conn, ~p"/prescriptions")
      assert html_response(conn, 200) =~ "Listing Prescriptions"
    end
  end

  describe "new prescription" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/prescriptions/new")
      assert html_response(conn, 200) =~ "New Prescription"
    end
  end

  describe "create prescription" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/prescriptions", prescription: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/prescriptions/#{id}"

      conn = get(conn, ~p"/prescriptions/#{id}")
      assert html_response(conn, 200) =~ "Prescription #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/prescriptions", prescription: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prescription"
    end
  end

  describe "edit prescription" do
    setup [:create_prescription]

    test "renders form for editing chosen prescription", %{conn: conn, prescription: prescription} do
      conn = get(conn, ~p"/prescriptions/#{prescription}/edit")
      assert html_response(conn, 200) =~ "Edit Prescription"
    end
  end

  describe "update prescription" do
    setup [:create_prescription]

    test "redirects when data is valid", %{conn: conn, prescription: prescription} do
      conn = put(conn, ~p"/prescriptions/#{prescription}", prescription: @update_attrs)
      assert redirected_to(conn) == ~p"/prescriptions/#{prescription}"

      conn = get(conn, ~p"/prescriptions/#{prescription}")
      assert html_response(conn, 200) =~ "some updated prescribing_doctor_name"
    end

    test "renders errors when data is invalid", %{conn: conn, prescription: prescription} do
      conn = put(conn, ~p"/prescriptions/#{prescription}", prescription: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prescription"
    end
  end

  describe "delete prescription" do
    setup [:create_prescription]

    test "deletes chosen prescription", %{conn: conn, prescription: prescription} do
      conn = delete(conn, ~p"/prescriptions/#{prescription}")
      assert redirected_to(conn) == ~p"/prescriptions"

      assert_error_sent 404, fn ->
        get(conn, ~p"/prescriptions/#{prescription}")
      end
    end
  end

  defp create_prescription(_) do
    prescription = prescription_fixture()
    %{prescription: prescription}
  end
end
