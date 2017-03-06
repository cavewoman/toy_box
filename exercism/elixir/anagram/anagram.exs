defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    match(string_to_comparable(base), candidates, []) 
  end

  def match(_, [], anagrams), do: anagrams

  def match(base, [head|tail], anagrams) do
    match(base, tail, match(base, string_to_comparable(head), head, anagrams))
  end

  def match(base, candidate_codepoints, candidate, anagrams) when length(base) == length(candidate_codepoints) do
    cond do
      base == candidate_codepoints ->
        anagrams
      base -- candidate_codepoints == [] ->
        anagrams ++ [candidate]
      true ->
        anagrams
    end
  end

  def match(_, _, _, anagrams), do: anagrams

  def string_to_comparable(string), do: String.codepoints(String.downcase(string))
end
