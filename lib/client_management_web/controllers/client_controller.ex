defmodule ClientManagementWeb.ClientController do
  use ClientManagementWeb, :controller

  alias ClientManagement.Management
  alias ClientManagement.Management.Client

  action_fallback ClientManagementWeb.FallbackController

  def index(conn, _params) do
    clients = Management.list_clients()
    render(conn, "index.json", clients: clients)
  end

  def create(conn, %{"client" => client_params}) do
    with {:ok, %Client{} = client} <- Management.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.client_path(conn, :show, client))
      |> render("show.json", client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Management.get_client!(id)
    render(conn, "show.json", client: client)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Management.get_client!(id)

    with {:ok, %Client{} = client} <- Management.update_client(client, client_params) do
      render(conn, "show.json", client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Management.get_client!(id)

    with {:ok, %Client{}} <- Management.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end
