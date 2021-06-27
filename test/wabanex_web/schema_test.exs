defmodule Test.WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.Users.Model.Users, as: UserModel

  describe "users queries" do
    test "when a valid id is give, returns the user", %{conn: conn} do
      params = %{email: "some@email.com", name: "Some name", password: "010001"}

      {:ok, %UserModel{id: user_id}} = Wabanex.create_user(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            id
            name
            email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "some@email.com",
            "id" => user_id,
            "name" => "Some name"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "Some name", email: "some@email.com", password: "010001"
          }){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Some name"}}} = response
    end
  end
