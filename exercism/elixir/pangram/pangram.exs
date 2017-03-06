defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence
      |> String.downcase()
      |> capture_only_letters()
      |> List.flatten()
      |> Enum.uniq()
      |> length() == 26
  end

  def capture_only_letters(string), do: Regex.scan(~r/[a-z]/, string)


end
