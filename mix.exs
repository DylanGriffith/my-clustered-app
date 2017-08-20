defmodule MyClusteredApp.Mixfile do
  use Mix.Project

  def project do
    [app: :my_clustered_app,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
     mod: {MyClusteredApp.Application, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:libcluster, "~> 2.1"},
      {:libcluster_cloud_foundry, git: "https://github.com/DylanGriffith/libcluster-cloud-foundry.git"},
    ]
  end
end
