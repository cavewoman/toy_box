defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    convert([3,5,7], number, "")
  end

  def convert([], number, raindrop) when raindrop == "", do: to_string(number)
  def convert([], number, raindrop), do: raindrop

  def convert([head|tail], number, raindrop) do
    cond do
      rem(number, head) == 0 ->
        convert(tail, number, raindrop <> word(head))
      true ->
        convert(tail, number, raindrop)
    end
  end

  def word(3), do: "Pling"
  def word(5), do: "Plang"
  def word(7), do: "Plong"

end
