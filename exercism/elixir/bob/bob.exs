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
    leftovers = String.strip(String.replace(input, ~r/[\p{Lu}\s\W\d]+\!/u, ""))
    cond do
      Bob.silent?(input) -> false
      leftovers == "" -> true
      Bob.all_caps?(input) -> true
      true -> false
    end
  end

  def all_caps?(input \\ "") do
    cond do
      Bob.silent?(input) -> false
      String.strip(String.replace(input, ~r/[\p{Lu}]/u, "")) == "" -> true
      true -> false
    end
  end

  def question?(input \\ "") do
    cond do
      List.last(String.codepoints(input)) == "?" -> true
      true -> false
    end 
  end

  def silent?(input \\ "") do
    cond do
      String.strip(input) == "" -> true
      true -> false
    end
  end
end
