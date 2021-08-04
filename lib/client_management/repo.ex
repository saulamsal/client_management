defmodule ClientManagement.Repo do
  use Ecto.Repo,
    otp_app: :client_management,
    adapter: Ecto.Adapters.Postgres
end
