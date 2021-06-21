defmodule Wabanex.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Wabanex.Repo,
      WabanexWeb.Telemetry,
      {Phoenix.PubSub, name: Wabanex.PubSub},
      WabanexWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Wabanex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    WabanexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
