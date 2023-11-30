defmodule SchoolScriptWeb.PrescriptionController do
  use SchoolScriptWeb, :controller

  alias SchoolScript.Pharmacy
  alias SchoolScript.Pharmacy.Prescription

  def index(conn, _params) do
    user = conn.assigns.current_user
    prescriptions = Pharmacy.list_prescriptions_for_user(user) |> IO.inspect()
    render(conn, :index, prescriptions: prescriptions)
  end

  def new(conn, _params) do
    changeset = Pharmacy.change_prescription(%Prescription{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"prescription" => prescription_params}) do
    case Pharmacy.create_prescription(prescription_params) do
      {:ok, prescription} ->
        conn
        |> put_flash(:info, "Prescription created successfully.")
        |> redirect(to: ~p"/prescriptions/#{prescription}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prescription = Pharmacy.get_prescription!(id)
    render(conn, :show, prescription: prescription)
  end

  def edit(conn, %{"id" => id}) do
    prescription = Pharmacy.get_prescription!(id)
    changeset = Pharmacy.change_prescription(prescription)
    render(conn, :edit, prescription: prescription, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prescription" => prescription_params}) do
    prescription = Pharmacy.get_prescription!(id)

    case Pharmacy.update_prescription(prescription, prescription_params) do
      {:ok, prescription} ->
        conn
        |> put_flash(:info, "Prescription updated successfully.")
        |> redirect(to: ~p"/prescriptions/#{prescription}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, prescription: prescription, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prescription = Pharmacy.get_prescription!(id)
    {:ok, _prescription} = Pharmacy.delete_prescription(prescription)

    conn
    |> put_flash(:info, "Prescription deleted successfully.")
    |> redirect(to: ~p"/prescriptions")
  end
end
