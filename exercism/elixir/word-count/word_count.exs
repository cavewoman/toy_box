defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> format_sentence()
    |> count(%{})
  end

  def count([], counts), do: counts

  def count([head|tail], counts) do 
    if Map.has_key?(counts, head) do
      count(tail, counts |> Map.put(head, counts[head] + 1))
    else
      count(tail, counts |> Map.put(head, 1))
    end
  end

  def format_sentence(sentence) do
    sentence 
    |> String.replace(~r/[^\w-]+/u, " ")
    |> String.replace(~r/_/, " ")
    |> String.downcase()
    |> String.trim()
    |> String.split(" ")
  end

end
