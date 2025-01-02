defmodule FitnessTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FitnessTrackerWeb.Telemetry,
      FitnessTracker.Repo,
      {DNSCluster, query: Application.get_env(:fitness_tracker, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FitnessTracker.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FitnessTracker.Finch},
      # Start a worker by calling: FitnessTracker.Worker.start_link(arg)
      # {FitnessTracker.Worker, arg},
      # Start to serve requests, typically the last entry
      FitnessTrackerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FitnessTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FitnessTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
