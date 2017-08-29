defmodule Playground do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "Hello")
  end

  def init(initial_data) do
    {:ok, initial_data}
  end

  def get_my_state(process_id) do
    GenServer.call(process_id, :get_the_state)
  end

  def set_my_state(process_id, new_state) do
    GenServer.call(process_id, {:set_the_state, new_state})
  end

  def set_my_state(:async, process_id, new_state) do
    GenServer.cast(process_id, {:set_the_state, new_state})
  end

  def handle_call(:get_the_state, _from, my_state) do
    {:reply, my_state, my_state}
  end

  def handle_call({:set_the_state, new_state}, _from, _state) do
    {:reply, new_state, new_state}
  end

  def handle_cast({:set_the_state, new_state}, _state)  do
    {:noreply, new_state}
  end
end
