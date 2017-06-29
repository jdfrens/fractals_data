defmodule Fractals.OutputManagerSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      supervisor(Fractals.OutputManagerSupervisor, []),
      worker(Fractals.OutputWorker, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end