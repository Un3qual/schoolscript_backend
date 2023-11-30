defmodule SchoolScriptWeb.MedicationHTML do
  use SchoolScriptWeb, :html

  embed_templates "medication_html/*"

  @doc """
  Renders a medication form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def medication_form(assigns)
end
