defmodule ShipsEngine.Ship do
  alias ShipsEngine.{Coordinate, Ship}

  @enforce_keys [:coordinates, :hit_coordinates]
  defstruct [:coordinates, :hit_coordinates]

  defp offsets(:square) do
    [{0, 0}, {0, 1}, {1, 0}, {1, 1}]
  end

  defp offsets(:atoll) do
    [{0, 0}, {0, 1}, {1, 1}, {2, 0}, {2, 1}]
  end

  defp offsets(:dot) do
    [{0,0}]
  end

  defp offsets(:l_shape) do
    [{0, 0}, {1, 0}, {2, 0}, {2, 1}]
  end

  defp offsets(:s_shape) do
    [{0, 1}, {0, 2}, {1, 0}, {1, 1}]
  end

  defp offsets do
    {:error, :invalid_ship_sintax}
  end

  def new() do
    %Ship{coordinates: MapSet.new, hit_coordinates: MapSet.new}
  end
end
