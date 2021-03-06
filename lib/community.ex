defmodule Community do
  use Application

  def start(_type, _args) do
    unless Mix.env == "prod" do
      Envy.auto_load
    end

    import Supervisor.Spec, warn: false

    unless Mix.env == "prod" do
      Envy.auto_load
    end

    children = [
      supervisor(Community.Endpoint, []),
      supervisor(Community.Repo, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Community.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Community.Endpoint.config_change(changed, removed)
    :ok
  end
end
