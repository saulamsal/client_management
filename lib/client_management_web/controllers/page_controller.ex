defmodule ClientManagementWeb.PageController do
  use ClientManagementWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
