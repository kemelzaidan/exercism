defmodule Username do
  @spec sanitize(char()) :: charlist()
  def sanitize([]), do: []

  def sanitize([hd | tail]) do
    cleaned =
      case hd do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        ?_ -> ~c"_"
        hd when hd in 97..122 -> [hd]
        _ -> ~c""
      end

    cleaned ++ sanitize(tail)
  end
end
