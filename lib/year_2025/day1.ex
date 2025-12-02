defmodule Advent.Year2025.Day1 do
  def get_password(input) do
    {_pos, password} = Enum.reduce(input, {50, 0}, &process_rotation/2)

    password
  end

  defp process_rotation(rotation, {pos, password}) do
    {dir, dist} = String.split_at(rotation, 1)
    dist = String.to_integer(dist)
    new_pos = rotate(dir, dist, pos)
    new_password = if new_pos == 0, do: password + 1, else: password
    {new_pos, new_password}
  end

  defp rotate("L", dist, pos) do
    rem(rem(pos - dist, 100) + 100, 100)
  end

  defp rotate("R", dist, pos) do
    rem(rem(pos + dist, 100) + 100, 100)
  end
end
