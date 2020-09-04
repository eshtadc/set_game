defmodule SetGame.Set do
  def verify(cards) do
    check_property(cards, :color) and check_property(cards, :number) and check_property(cards, :pattern) and check_property(cards, :shape)
  end

  defp check_property(cards, property) do
    cards
    |> get_unique_property_values(property)
    |> Enum.count()
    |> is_allowed_set?(Enum.count(cards))
  end

  defp get_unique_property_values(cards, property) do
    cards
    |> Enum.map(fn card -> Map.get(card, property) end)
    |> Enum.frequencies()
    |> Map.keys()
  end


  defp is_allowed_set?(1, _cards), do: true
  defp is_allowed_set?(unique_count, total_cards) when unique_count === total_cards, do: true
  defp is_allowed_set?(_unique_count, _total_cards), do: false

end
