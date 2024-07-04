defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list) 
  
  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total([]), do: 0
  def total(list) do
    Enum.reduce(list, &(&1 + &2))
  end

  def busy_days(list) do
    Enum.filter(list, &(&1 >= 5)) |> length()
  end
end
