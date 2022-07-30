defmodule SomethingToMeasure.Worker do
  use GenServer
  require Logger

  require OpenTelemetry.Tracer, as: Tracer
  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(state) do
    Logger.configure(level: :info)
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_cast(:action, state) do
    Logger.info("This is the action")
    Tracer.with_span "my-span", %{attributes: [{<<"my-key-1">>, <<"my-value-1">>}]} do #TODO add attributes
      Tracer.set_attributes([{"another-key-1", "another-value-1"}]) #TODO add attributes
    end
    {:noreply, state}
  end

  def action do
    Logger.info "Before action"
    GenServer.cast(__MODULE__, :action)
  end
end
