defmodule ClientManagementWeb.ClientView do
  use ClientManagementWeb, :view
  alias ClientManagementWeb.ClientView

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id,
      title: client.title,
      description: client.description}
  end
end
