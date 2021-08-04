defmodule ClientManagement.Management.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
