defmodule Username do
  @spec sanitize(char()) :: charlist()
  def sanitize(~c""), do: ~c""
  def sanitize([hd | tail]) when hd in 97..122, do: to_charlist([hd]) ++ sanitize(tail)

  def sanitize([hd | tail]) do
    latin =
      case hd do
        hd when [hd] == ~c"ä" -> ~c"ae"
        hd when [hd] == ~c"ö" -> ~c"oe"
        hd when [hd] == ~c"ü" -> ~c"ue"
        hd when [hd] == ~c"ß" -> ~c"ss"
        hd when [hd] == ~c"_" -> ~c"_"
        _ -> ~c""
      end

    latin ++ sanitize(tail)
  end
end
