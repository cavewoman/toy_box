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
  def histogram(strand), do: histogram(@nucleotides, strand, %{})

  def histogram([head|tail], strand, counted) do
    histogram(tail, strand, Map.put_new(counted, head, count(strand, head)))
  end

  def histogram([], _, counted), do: counted

end
