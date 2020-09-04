defmodule SetGame do
  alias SetGame.Deck
  alias SetGame.Set
  alias SetGame.Mathy

  @cards_in_play 12
  @set_size 3

  @moduledoc """
  Documentation for SetGame.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SetGame.hello()
      :world

  """
  def create() do
    Deck.prepare()
    # returns cards in play and then the rest of the deck
    |> Deck.deal(@cards_in_play)
  end

  def remove_set_from_play(in_play, cards_to_remove) do
    in_play
    |> Enum.reject(fn card -> Enum.member?(cards_to_remove, card) end)
  end

  def deal(deck, in_play) do
    number_to_deal = @cards_in_play - Enum.count(in_play)
    {cards_to_add, deck} = Deck.deal(deck, number_to_deal)
    {in_play ++ cards_to_add, deck}
  end

  def valid_set?(cards) do
    Set.verify(cards)
  end

  def has_valid_sets?(cards) do
    Mathy.combination(@set_size, cards)
    |> Enum.any?(fn possible -> valid_set?(possible) end)
  end

  def get_valid_sets(cards) do
    Mathy.combination(@set_size, cards)
    |> Enum.filter(fn possible -> valid_set?(possible) end)
  end
end
