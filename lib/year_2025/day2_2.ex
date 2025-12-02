defmodule Advent.Year2025.Day2_2 do
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
    |> Enum.filter(fn x -> invalid_id?(Integer.to_string(x)) end)
    |> Enum.sum()
  end

  defp invalid_id?(id) when is_binary(id) do
    len = String.length(id)

    1..len
    |> Enum.any?(fn i ->
      substr = String.slice(id, 0, i)

      if rem(len, i) != 0 do
        false
      else
        repeat_times = div(len, i)

        repeat_times > 1 and
          String.duplicate(substr, repeat_times) == id
      end
    end)
  end
end
