defmodule WabanexWeb.Router do
  use WabanexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WabanexWeb do
    pipe_through :api
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: WabanexWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: WabanexWeb.Schema
  end

  if Mix.env() in [:dev, :test] do
    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
    end
  end
end
