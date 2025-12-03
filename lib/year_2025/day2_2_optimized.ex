defmodule Advent.Year2025.Day2_2_Optimized do
  def sum_of_invalid_ids(s) do
    parse(s)
    |> Enum.flat_map(fn [a, b] -> all_invalid_ids(a, b) end)
    |> Enum.sum()
  end

  defp digits(a) do
    trunc(:math.floor(:math.log10(a))) + 1
  end

  defp pow10(n), do: trunc(:math.pow(10, n))

  defp multiplier(d, 2), do: pow10(d) + 1
  defp multiplier(d, n), do: 1 + pow10(d) * multiplier(d, n - 1)

  defp start_and_multiplier(a, n) do
    dig = digits(a)
    {d, m} = {div(dig, n), Integer.mod(dig, n)}

    if m == 0 do
      {div(a, pow10(dig - d)), multiplier(d, n)}
    else
      {pow10(d), multiplier(d + 1, n)}
    end
  end

  defp invalid_ids(a, b, n) do
    {start, mult} = start_and_multiplier(a, n)
    max_start = pow10(digits(start))

    start..(max_start - 1)
    |> Enum.reduce_while([], fn i, acc ->
      x = i * mult

      cond do
        x < a -> {:cont, acc}
        x > b || start >= max_start -> {:halt, Enum.reverse(acc)}
        true -> {:cont, [x | acc]}
      end
    end)
  end

  defp parse(s) do
    String.split(s, ",")
    |> Enum.map(fn s ->
      [a, b] = String.split(s, "-")
      [String.to_integer(a), String.to_integer(b)]
    end)
  end

  defp all_invalid_ids(a, b) do
    2..max(digits(b), 2)
    |> Enum.flat_map(fn i -> invalid_ids(a, b, i) end)
    |> Enum.uniq()
  end
end
