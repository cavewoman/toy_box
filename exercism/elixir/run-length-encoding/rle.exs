defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    encode(String.codepoints(string), "", 0, "")
  end

  def encode([], letter, _, _) when letter == "", do: ""
  def encode([], letter, count, encoded), do: "#{encoded}#{count}#{letter}"

  def encode([head|tail], letter, count, encoded) do
    cond do
      letter == "" ->
        encode(tail, head, 1, encoded)
      head == letter ->
        encode(tail, head, count + 1, encoded)
      true ->
        encode(tail, head, 1, "#{encoded}#{count}#{letter}")
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    decode(String.codepoints(string), "", "")
  end

  def decode([], _, decoded), do: decoded

  def decode([head|tail], count, decoded) do
    cond do
      String.match?(head, ~r/\d/) ->
        decode(tail, "#{count}#{head}", decoded)
      true ->
        {number, _} = Integer.parse(count)
        decode(tail, "", "#{decoded}#{expand(head, number)}")
    end
  end
  
  def expand(letter, number), do: expand(letter, number, 0, "")
  def expand(letter, number, acc, string) when acc == number, do: string
  def expand(letter, number, acc, string) when acc < number do
    expand(letter, number, acc + 1, "#{string}#{letter}")
  end
end
