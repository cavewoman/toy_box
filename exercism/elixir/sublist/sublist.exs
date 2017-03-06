defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal

  def compare(_, []), do: :superlist

  def compare([], _), do: :sublist

  def compare(a,b) when length(a) > length(b) do
    cond do
      out_of_bounds(Enum.sort(a),Enum.sort(b)) ->
        :unequal
      true ->
        compare(b, a, :superlist)
    end
  end

  def compare(a,b) when length(a) < length(b) do
    cond do
      out_of_bounds(a,b) ->
        :unequal
      true ->
        compare(a, b, :sublist)
    end
  end

  def compare(a, b) when length(a) == length(b), do: :unequal

  def compare(a, b, result), do: compare(a, b, result, a, b, false)

  def compare([], _, result, _, _, _), do: result

  def compare(_, [], _, _, _, _), do: :unequal

  def compare([h1|t1], [h2|t2], result, sub, [suph|supt], pattern_started) do
    cond do
      h1 === h2 ->
        compare(t1, t2, result, sub, [suph|supt], true)
      pattern_started ->
        compare(sub, supt, result, sub, supt, false)
      !pattern_started ->
        compare([h1|t1], t2, result, sub, t2, false)
      true ->
        :unequal
    end
  end

  def out_of_bounds([h1|t1], [h2|t2]) do
    cond do
      h1 < h2 and List.last(t1) < List.last(t2) ->
        true
      h1 > h2 and List.last(t1) > List.last(t2) ->
        true
      true ->
        false
    end
  end
  
end
