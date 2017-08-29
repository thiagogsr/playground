defmodule PlaygroundSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Playground, [])
    ]

    supervise(children, strategy: :one_for_one)
  end

  def restart(super_pid) do
    [first] = Supervisor.which_children(super_pid)
    {_, child_pid, _, _} = first
    GenServer.stop(child_pid)
  end
end
