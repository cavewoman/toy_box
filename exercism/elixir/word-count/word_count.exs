defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
      |> removePunct
      |> String.split
      |> count_words(%{})
  end

  def count_words([head|tail], word_count) do
    count_words(tail, count_word(word_count, head))
  end

  def count_words([], word_count) do
    word_count
  end

  def count_word(word_count, word) do
    current_count = Map.get(word_count, word)
    if !current_count do
      Map.put(word_count, word, 1)
    else
      Map.put(word_count, word, current_count + 1)
    end
  end

  def removePunct(sentence) do 
    sentence
      |> String.downcase
      |> String.replace(~r/[^\w\s\d|\w\-\w]/u, "")
      |> String.replace(~r/\_/u, " ")
  end

end
