defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) when str == "" , do: true

  def check_brackets(str) do
    check_brackets(String.codepoints(str), [])  
  end

  def check_brackets([], []), do: true
  def check_brackets([], _), do: false

  def check_brackets([head| tail], openers) when head == "{" do
     check_brackets(tail, openers ++ ["{"])
  end
    
  def check_brackets([head| tail], openers) when head == "[" do
     check_brackets(tail, openers ++ ["["])
  end
    
  def check_brackets([head| tail], openers) when head == "(" do
     check_brackets(tail, openers ++ ["("])
  end
    
  def check_brackets([head| tail], openers) when head == "}" do
    cond do
      Enum.member?(openers, "{") ->
        check_brackets(tail, openers -- ["{"])
      true ->
        false
    end
  end
    
  def check_brackets([head| tail], openers) when head == "]" do
    cond do
      Enum.member?(openers, "[") ->
        check_brackets(tail, openers -- ["["])
      true ->
        false
    end
  end
    
  def check_brackets([head| tail], openers) when head == ")" do
    cond do
      Enum.member?(openers, "(") ->
        check_brackets(tail, openers -- ["("])
      true ->
        false
    end
  end
    
end
