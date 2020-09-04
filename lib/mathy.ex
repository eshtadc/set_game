defmodule SetGame.Mathy do
  # From https://github.com/aneta-bielska/set_game/blob/master/elixir/set_game.ex
  def combination(0, _), do: [[]]
  def combination(_, []), do: []
  def combination(n, [h|t]) do
    (for y <- combination(n - 1, t), do: [h|y]) ++ combination(n, t)
  end
end
