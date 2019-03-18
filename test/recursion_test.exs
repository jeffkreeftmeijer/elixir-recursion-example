defmodule RecursionTest do
  use ExUnit.Case
  doctest Recursion

  test "greets the world" do
    assert Recursion.hello() == :world
  end
end
