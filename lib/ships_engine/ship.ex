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

  defp add_coordinates(offsets, upper_left) do
    Enum.reduce_while(
      offsets,
      MapSet.new,
      fn offset, acc ->
        add_coordinate(acc, upper_left, offset)
      end
    )
  end

  defp add_coordinate(coordinates, %Coordinate{row: row, col: col}, {row_offset, col_offset}) do
    case Coordinate.new(row + row_offset, col + col_offset) do
      {:ok, coordinate} -> {:cont, MapSet.put(coordinates, coordinate)}
      {:error, :invalid_coordinate} -> {:halt, {:error, :invalid_coordinate}}
    end
  end

  def new(type, %Coordinate{} = upper_left) do
    # %Ship{coordinates: MapSet.new, hit_coordinates: MapSet.new}
    with [_|_] = offsets <- offsets(type), %MapSet{} = coordinates <- add_coordinates(offsets, upper_left)  do
      {:ok, %Ship{coordinates: coordinates, hit_coordinates: MapSet.new}}
    else
      error -> error
    end
  end

end
