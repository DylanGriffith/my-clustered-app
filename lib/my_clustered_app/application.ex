defmodule MyClusteredApp.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = elem(Integer.parse(System.get_env("PORT")), 0)
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, MyClusteredApp.Router, [], [port: port]),
    ]

    opts = [strategy: :one_for_one, name: MyClusteredApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
