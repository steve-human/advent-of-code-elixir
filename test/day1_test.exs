defmodule AdventTest.Day1 do
  use ExUnit.Case
  alias Advent.Year2025.Day1

  test "day 1 returns the correct password" do
    input = [
      "L68",
      "L30",
      "R48",
      "L5",
      "R60",
      "L55",
      "L1",
      "L99",
      "R14",
      "L82"
    ]

    assert Day1.get_password(input) == 3
  end
end
