defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
      |> String.split(~r/\s+/)
      |> grab_first_letters
  end

  def grab_first_letters(words) do
    Enum.map(words, fn(x) -> get_something(x) end)
  end

  def get_something(word) do
    word
      |> String.codepoints
      |> get_all_caps
  end

  def combine_letters(letters) do
    Enum.join(letters, "")
  end

  def get_all_caps(letters) do
    letters
      |> Enum.with_index
      |> Enum.flat_map(fn(x) -> Enum.fetch(Tuple.to_list(x), 0) end)
  end 

end
