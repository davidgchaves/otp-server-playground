defmodule FridgeServerTest do
  use ExUnit.Case

  test "putting something into the fridge" do
    {:ok, fridge} = :gen_server.start_link FridgeServer, [], []
    assert :ok == :gen_server.call fridge, {:store, :bacon}
  end
end
