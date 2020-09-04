defmodule SetGame.Deck do
  alias SetGame.Card

  def prepare(numbers \\ 1..3, colors \\ ~w(red blue green)a, shapes \\ ~w(oval squiggle diamond)a, patterns \\ ~w(solid striped outlined)a) do
    create(numbers, colors, shapes, patterns)
    |> Enum.shuffle()
  end

  def deal(deck, number) do
    deck
    |> Enum.split(number)
  end

  defp create(numbers, colors, shapes, patterns) do
    # Given a three properties of three options each, create a card for each type
    Enum.flat_map(numbers, fn number ->
      Enum.flat_map(colors, fn color ->
        Enum.flat_map(shapes, fn shape ->
          Enum.map(patterns, fn pattern ->
            %Card{color: color, number: number, shape: shape, pattern: pattern}
          end)
        end)
      end)
    end)
  end
end
