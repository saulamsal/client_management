defmodule ClientManagement.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :title, :string
      add :description, :text

      timestamps()
    end

  end
end
