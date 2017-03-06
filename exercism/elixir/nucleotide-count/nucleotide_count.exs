defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count('', _), do: 0

  def count(strand, nucleotide), do: count(to_charlist(strand), nucleotide, 0)

  def count([head|tail], nucleotide, count) when head == nucleotide do
    count(tail, nucleotide, count + 1)
  end

  def count([_|tail], nucleotide, count), do: count(tail, nucleotide, count)

  def count([], _, count), do: count

  @spec histogram([char]) :: map
  def histogram(strand), do: histogram(to_charlist(strand), %{?A => 0, ?T => 0, ?C => 0, ?G => 0})

  def histogram([head|tail], counted) do
    {_, updated} = Map.get_and_update(counted, head, fn
      (nil) -> {nil, 1}
      (current) -> {current, current + 1}   
    end)
    histogram(tail, updated)
  end

  def histogram([], counted), do: counted

end
