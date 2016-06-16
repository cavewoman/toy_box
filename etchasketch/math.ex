defmodule Math do
  def zero?(0), do: true

  def zero?(x) when is_integer(x), do: false

  def sum_list([head | tail], accumulator) do
    sum_list(tail, accumulator + head)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def sum(a,b) do
    a + b
  end
end
