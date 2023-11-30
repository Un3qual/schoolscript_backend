defmodule SchoolScript.Repo do
  use Ecto.Repo,
    otp_app: :school_script,
    adapter: Ecto.Adapters.Postgres
end
