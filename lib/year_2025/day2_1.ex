defmodule Advent.Year2025.Day2_1 do
  def sum_of_invalid_ids(input) do
    String.split(input, ",")
    |> Enum.map(&sum_invalid_in_range/1)
    |> Enum.sum()
  end

  defp sum_invalid_in_range(range) do
    [lo, hi] =
      range
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)

    lo..hi
    |> Enum.filter(fn x -> is_invalid_id(Integer.to_string(x)) end)
    |> Enum.sum()
  end

  defp is_invalid_id(id) when is_binary(id) do
    len = String.length(id)

    if rem(len, 2) != 0 do
      false
    else
      mid = div(len, 2)
      {left, right} = String.split_at(id, mid)
      left == right
    end
  end
end
