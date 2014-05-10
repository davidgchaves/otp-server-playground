defmodule FridgeServer do
  use GenServer.Behaviour

  def init(items) do
    {:ok, items}
  end

  def handle_call({:store, item}, _from, items) do
    {:reply, :ok, [item|items]}
  end

  def handle_call({:take, item}, _from, items) do
    {:reply, {:ok, item}, items}
  end
end
