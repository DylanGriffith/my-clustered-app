use Mix.Config

config :libcluster,
  topologies: [
    cf_clustering: [
      strategy: Cluster.Strategy.CloudFoundryEureka,
      config: [
      ]
    ]
  ]
