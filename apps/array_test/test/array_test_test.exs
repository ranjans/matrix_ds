defmodule ArrayTestTest do
  use ExUnit.Case
  doctest ArrayTest

  test "greets the world" do
    assert ArrayTest.from_list([]) |>  :array.to_list() == []
  end
end
