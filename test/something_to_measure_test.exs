defmodule SomethingToMeasureTest do
  use ExUnit.Case
  doctest SomethingToMeasure

  test "greets the world" do
    assert SomethingToMeasure.hello() == :world
  end
end
