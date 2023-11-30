defmodule SchoolScriptWeb.MedicationControllerTest do
  use SchoolScriptWeb.ConnCase

  import SchoolScript.PharmacyFixtures

  @create_attrs %{written_name: "some written_name", brand_name: "some brand_name", generic_name: "some generic_name", dose: "some dose", dea_schedule: 42}
  @update_attrs %{written_name: "some updated written_name", brand_name: "some updated brand_name", generic_name: "some updated generic_name", dose: "some updated dose", dea_schedule: 43}
  @invalid_attrs %{written_name: nil, brand_name: nil, generic_name: nil, dose: nil, dea_schedule: nil}

  describe "index" do
    test "lists all medications", %{conn: conn} do
      conn = get(conn, ~p"/medications")
      assert html_response(conn, 200) =~ "Listing Medications"
    end
  end

  describe "new medication" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/medications/new")
      assert html_response(conn, 200) =~ "New Medication"
    end
  end

  describe "create medication" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/medications", medication: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/medications/#{id}"

      conn = get(conn, ~p"/medications/#{id}")
      assert html_response(conn, 200) =~ "Medication #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/medications", medication: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Medication"
    end
  end

  describe "edit medication" do
    setup [:create_medication]

    test "renders form for editing chosen medication", %{conn: conn, medication: medication} do
      conn = get(conn, ~p"/medications/#{medication}/edit")
      assert html_response(conn, 200) =~ "Edit Medication"
    end
  end

  describe "update medication" do
    setup [:create_medication]

    test "redirects when data is valid", %{conn: conn, medication: medication} do
      conn = put(conn, ~p"/medications/#{medication}", medication: @update_attrs)
      assert redirected_to(conn) == ~p"/medications/#{medication}"

      conn = get(conn, ~p"/medications/#{medication}")
      assert html_response(conn, 200) =~ "some updated written_name"
    end

    test "renders errors when data is invalid", %{conn: conn, medication: medication} do
      conn = put(conn, ~p"/medications/#{medication}", medication: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Medication"
    end
  end

  describe "delete medication" do
    setup [:create_medication]

    test "deletes chosen medication", %{conn: conn, medication: medication} do
      conn = delete(conn, ~p"/medications/#{medication}")
      assert redirected_to(conn) == ~p"/medications"

      assert_error_sent 404, fn ->
        get(conn, ~p"/medications/#{medication}")
      end
    end
  end

  defp create_medication(_) do
    medication = medication_fixture()
    %{medication: medication}
  end
end
