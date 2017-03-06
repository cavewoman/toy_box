defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
      |> String.split(~r/\s+/)
      |> grab_letters
      |> Enum.join("")
      |> String.upcase
  end

  def grab_letters(words) do
    Enum.map(words, fn(x) -> collect_letters(String.codepoints(x), "") end)
  end

  def collect_letters([head|tail], ""),  do: collect_letters(tail, head)

  def collect_letters([head|tail], collected) do
    cond do
      is_upcased(head) ->
        collect_letters(tail, collected <> head)
      true ->
        collect_letters(tail, collected)
    end
  end

  def collect_letters([], collected), do: collected

  def is_upcased(char), do: char =~ ~r/\p{Lu}/u

end
