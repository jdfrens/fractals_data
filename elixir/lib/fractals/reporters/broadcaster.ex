defmodule Fractals.Reporters.Broadcaster do
  @moduledoc """
  Broadcasts messages to reporters.
  """

  use GenServer

  alias Fractals.Params
  alias Fractals.Reporters.Supervisor

  # client

  def start_link(reporters \\ []) do
    GenServer.start_link(__MODULE__, reporters, name: __MODULE__)
  end

  @spec add_reporter(module, any) :: :ok
  def add_reporter(reporter, args \\ []) do
    GenServer.cast(__MODULE__, {:add, reporter, args})
  end

  @spec report(atom, Params.t(), keyword) :: :ok
  def report(tag, params, opts \\ []) do
    GenServer.cast(__MODULE__, {:report, {tag, params, opts}})
  end

  # server

  @impl GenServer
  def init(reporters) do
    {:ok, reporters}
  end

  @impl GenServer
  def handle_cast({:add, reporter, args}, reporters) do
    Supervisor.add_reporter(reporter, args)
    {:noreply, [reporter | reporters]}
  end

  @impl GenServer
  def handle_cast({:report, {tag, params, opts}}, reporters) do
    Enum.each(reporters, fn reporter ->
      GenServer.cast(reporter, {tag, params, opts})
    end)

    {:noreply, reporters}
  end
end
