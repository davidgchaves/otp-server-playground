defmodule FridgeServerTest do
  use ExUnit.Case

  test "putting something into the fridge" do
    fridge = FridgeServer.start_link
    assert :ok == :gen_server.call fridge, {:store, :bacon}
  end

  test "removing something from the fridge" do
    fridge = FridgeServer.start_link
    :gen_server.call fridge, {:store, :bacon}
    assert {:ok, :bacon} == :gen_server.call fridge, {:take, :bacon}
  end

  test "taking something from the fridge that isn't in there" do
    fridge = FridgeServer.start_link
    assert :not_found == :gen_server.call fridge, {:take, :bacon}
  end
end
