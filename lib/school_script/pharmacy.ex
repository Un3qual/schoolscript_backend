defmodule SchoolScript.Pharmacy do
  @moduledoc """
  The Pharmacy context.
  """

  import Ecto.Query, warn: false
  alias SchoolScript.Repo

  alias SchoolScript.Pharmacy.Medication

  @doc """
  Returns the list of medications.

  ## Examples

      iex> list_medications()
      [%Medication{}, ...]

  """
  def list_medications do
    Repo.all(Medication)
  end

  @doc """
  Gets a single medication.

  Raises `Ecto.NoResultsError` if the Medication does not exist.

  ## Examples

      iex> get_medication!(123)
      %Medication{}

      iex> get_medication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_medication!(id), do: Repo.get!(Medication, id)

  @doc """
  Creates a medication.

  ## Examples

      iex> create_medication(%{field: value})
      {:ok, %Medication{}}

      iex> create_medication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medication(attrs \\ %{}) do
    %Medication{}
    |> Medication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medication.

  ## Examples

      iex> update_medication(medication, %{field: new_value})
      {:ok, %Medication{}}

      iex> update_medication(medication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medication(%Medication{} = medication, attrs) do
    medication
    |> Medication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a medication.

  ## Examples

      iex> delete_medication(medication)
      {:ok, %Medication{}}

      iex> delete_medication(medication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medication(%Medication{} = medication) do
    Repo.delete(medication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medication changes.

  ## Examples

      iex> change_medication(medication)
      %Ecto.Changeset{data: %Medication{}}

  """
  def change_medication(%Medication{} = medication, attrs \\ %{}) do
    Medication.changeset(medication, attrs)
  end

  alias SchoolScript.Pharmacy.Prescription

  @doc """
  Returns the list of prescriptions.

  ## Examples

      iex> list_prescriptions()
      [%Prescription{}, ...]

  """
  def list_prescriptions do
    Repo.all(Prescription)
  end

  def list_prescriptions_for_user(%SchoolScript.Accounts.User{id: user_id}) do
    Repo.all(from p in Prescription,
      where: p.user_id == ^user_id,
      preload: [:medication]
    )
  end

  @doc """
  Gets a single prescription.

  Raises `Ecto.NoResultsError` if the Prescription does not exist.

  ## Examples

      iex> get_prescription!(123)
      %Prescription{}

      iex> get_prescription!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prescription!(id), do: Repo.get!(Prescription, id)

  @doc """
  Creates a prescription.

  ## Examples

      iex> create_prescription(%{field: value})
      {:ok, %Prescription{}}

      iex> create_prescription(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prescription(attrs \\ %{}) do
    %Prescription{}
    |> Prescription.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prescription.

  ## Examples

      iex> update_prescription(prescription, %{field: new_value})
      {:ok, %Prescription{}}

      iex> update_prescription(prescription, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prescription(%Prescription{} = prescription, attrs) do
    prescription
    |> Prescription.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prescription.

  ## Examples

      iex> delete_prescription(prescription)
      {:ok, %Prescription{}}

      iex> delete_prescription(prescription)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prescription(%Prescription{} = prescription) do
    Repo.delete(prescription)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prescription changes.

  ## Examples

      iex> change_prescription(prescription)
      %Ecto.Changeset{data: %Prescription{}}

  """
  def change_prescription(%Prescription{} = prescription, attrs \\ %{}) do
    Prescription.changeset(prescription, attrs)
  end
end
