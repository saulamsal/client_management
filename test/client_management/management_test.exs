defmodule ClientManagement.ManagementTest do
  use ClientManagement.DataCase

  alias ClientManagement.Management

  describe "clients" do
    alias ClientManagement.Management.Client

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Management.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Management.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Management.create_client(@valid_attrs)
      assert client.description == "some description"
      assert client.title == "some title"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Management.update_client(client, @update_attrs)
      assert client.description == "some updated description"
      assert client.title == "some updated title"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_client(client, @invalid_attrs)
      assert client == Management.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Management.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Management.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Management.change_client(client)
    end
  end
end
