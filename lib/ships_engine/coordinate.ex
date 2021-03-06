defmodule ShipsEngine.Coordinate do
  alias ShipsEngine.Coordinate, as: Coordinate

  @enforce_keys [:row, :col]
  @board_range 1..10
  defstruct [:row, :col]

  def new(row, col) when row in (@board_range) and col in (@board_range) do
    {:ok, %Coordinate{row: row, col: col}}
  end

  def new(_row, _col) do
    {:error, :invalid_coordinate}
  end
end
