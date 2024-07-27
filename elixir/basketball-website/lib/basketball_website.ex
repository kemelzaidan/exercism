defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    tokens = String.split(path, ".")
    do_extract_from_path(data, tokens)
  end

  defp do_extract_from_path(data, []), do: data

  defp do_extract_from_path(data, [head | tail]) do
    do_extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    tokens = String.split(path, ".")
    get_in(data, tokens)
  end
end
