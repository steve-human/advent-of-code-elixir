defmodule AdventTest.Day2_2 do
  use ExUnit.Case
  alias Advent.Year2025.Day2_2

  test "day 2 part 2 returns correct sum of invalid ids" do
    input =
      "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    assert Day2_2.sum_of_invalid_ids(input) == 4_174_379_265
  end

  test "day 2 part 2 returns correct sum of invalid ids from input" do
    input = Advent.Year2025.Input.Day2.get_input()

    assert Day2_2.sum_of_invalid_ids(input) == 45_283_684_555
  end
end
