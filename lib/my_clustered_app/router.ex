defmodule MyClusteredApp.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    response = %{
      current_node: :erlang.node,
      connected_nodes: :erlang.nodes
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, Poison.encode!(response))
  end
end
