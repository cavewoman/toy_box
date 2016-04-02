defmodule Bob do
  def hey(input \\ "") do
    cond do
      Bob.silent?(input) -> "Fine. Be that way!"
      Bob.question?(input) -> "Sure."
      Bob.yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def yelling?(input \\ "") do
    Bob.all_caps?(input) or Bob.just_caps?(input)
  end

  def all_caps?(input \\ "") do
    input
      |> String.replace(~r/[\p{Lu}\s\W\d]+\!/u, "")
      |> String.strip
      |> Bob.equals?("")
  end

  def just_caps?(input \\ "") do
    input
      |> String.replace(~r/[\p{Lu}]/u, "")
      |> String.strip
      |> Bob.equals?("")
  end

  def question?(input \\ "") do
    input
      |> String.codepoints
      |> List.last
      |> Bob.equals?("?")
  end

  def silent?(input \\ "") do
    String.strip(input) == ""
  end

  def equals?(input \\ "", string) do
    input == string
  end
end
