defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) when str == "" , do: true
  def check_brackets(str), do: check_brackets(String.codepoints(str),"", [])  

  def check_brackets([], "", []), do: true
  def check_brackets([], _, _), do: false

  def check_brackets([head|tail], "", unmatched) when head == "{", do: check_brackets(tail, head, unmatched)
  def check_brackets([head|tail], opener, unmatched) when head == "{", do: check_brackets(tail, head, unmatched ++ [opener])
  def check_brackets([head|tail], "{", unmatched) when head == "}", do: check_brackets(unmatched ++ tail, "", [])
  def check_brackets([head|_], _, _) when head == "}", do: false

  def check_brackets([head|tail], "", unmatched) when head == "[", do: check_brackets(tail, head, unmatched)
  def check_brackets([head|tail], opener, unmatched) when head == "[", do: check_brackets(tail, head, unmatched ++ [opener])
  def check_brackets([head|tail], "[", unmatched) when head == "]", do: check_brackets(unmatched ++ tail, "", [])
  def check_brackets([head|_], _, _) when head == "]", do: false

  def check_brackets([head|tail], "", unmatched) when head == "(", do: check_brackets(tail, head, unmatched)
  def check_brackets([head|tail], opener, unmatched) when head == "(", do: check_brackets(tail, head, unmatched ++ [opener])
  def check_brackets([head|tail], "(", unmatched) when head == ")", do: check_brackets(unmatched ++ tail, "", [])
  def check_brackets([head|_], _, _) when head == ")", do: false

  def check_brackets([head|tail], opener, unmatched), do: check_brackets(tail, opener, unmatched)
    
end
