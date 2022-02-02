defmodule ShipsEngine.Guesses do
  #alias ShipEngine.Guesses, as: Guesses

  @enforce_keys [:hits, :misses]
  defstruct [:hits, :misses]

  def new() do
    %{hits: MapSet.new, misses: MapSet.new}
  end
end
