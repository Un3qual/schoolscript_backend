defmodule SchoolScriptWeb.MedicationController do
  use SchoolScriptWeb, :controller

  alias SchoolScript.Pharmacy
  alias SchoolScript.Pharmacy.Medication

  def index(conn, _params) do
    medications = Pharmacy.list_medications()
    render(conn, :index, medications: medications)
  end

  def new(conn, _params) do
    changeset = Pharmacy.change_medication(%Medication{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"medication" => medication_params}) do
    case Pharmacy.create_medication(medication_params) do
      {:ok, medication} ->
        conn
        |> put_flash(:info, "Medication created successfully.")
        |> redirect(to: ~p"/medications/#{medication}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    medication = Pharmacy.get_medication!(id)
    render(conn, :show, medication: medication)
  end

  def edit(conn, %{"id" => id}) do
    medication = Pharmacy.get_medication!(id)
    changeset = Pharmacy.change_medication(medication)
    render(conn, :edit, medication: medication, changeset: changeset)
  end

  def update(conn, %{"id" => id, "medication" => medication_params}) do
    medication = Pharmacy.get_medication!(id)

    case Pharmacy.update_medication(medication, medication_params) do
      {:ok, medication} ->
        conn
        |> put_flash(:info, "Medication updated successfully.")
        |> redirect(to: ~p"/medications/#{medication}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, medication: medication, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    medication = Pharmacy.get_medication!(id)
    {:ok, _medication} = Pharmacy.delete_medication(medication)

    conn
    |> put_flash(:info, "Medication deleted successfully.")
    |> redirect(to: ~p"/medications")
  end
end
