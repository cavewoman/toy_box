defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    to(limit, factors, [])
  end

  def to(_, [], multiples), do: Enum.reduce(Enum.uniq(multiples), 0, fn(x, acc) -> x + acc end)

  def to(limit, [head|tail], multiples) do
    to(limit, tail, to(limit, head, multiples, 1))
  end

  def to(limit, _, multiples, number) when limit == number do
    multiples
  end

  def to(limit, factor, multiples, number) do
    cond do
      rem(number, factor) == 0 ->
        to(limit, factor, multiples ++ [number], number + 1)
      true ->
        to(limit, factor, multiples, number + 1)
    end
  end
end
