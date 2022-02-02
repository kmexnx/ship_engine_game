defmodule ShipsEngineTest do
  use ExUnit.Case
  doctest ShipsEngine

  test "greets the world" do
    assert ShipsEngine.hello() == :world
  end
end
