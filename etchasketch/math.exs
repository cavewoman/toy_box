defmodule Math do
  def zero?(0), do: true

  def zero?(x) when is_integer(x), do: false

  def sum_list([head | tail], accumulator), do: sum_list(tail, sum(head, accumulator))

  def sum_list([], accumulator), do: accumulator
  
  def sum(a,b), do: a + b

  def double_each([head | tail]), do: [head * 2 | double_each(tail)]

  def double_each([]), do: []
end 
