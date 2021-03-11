defmodule AutoWatering.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AutoWatering.Repo,
      # Start the Telemetry supervisor
      AutoWateringWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AutoWatering.PubSub},
      # Start the Endpoint (http/https)
      AutoWateringWeb.Endpoint
      # Start a worker by calling: AutoWatering.Worker.start_link(arg)
      # {AutoWatering.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AutoWatering.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AutoWateringWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
