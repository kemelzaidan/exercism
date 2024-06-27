defmodule KitchenCalculator do
  def get_volume({volume, quant}) do
    elem({volume, quant}, 1)
  end

  def to_milliliter({:milliliter, quant}), do: {:milliliter, quant}
  def to_milliliter({:cup, quant}), do: {:milliliter, quant * 240}
  def to_milliliter({:fluid_ounce, quant}), do: {:milliliter, quant * 30}
  def to_milliliter({:teaspoon, quant}), do: {:milliliter, quant * 5}
  def to_milliliter({:tablespoon, quant}), do: {:milliliter, quant * 15}

  def from_milliliter({:milliliter, quant}, :milliliter), do: {:milliliter, quant}
  def from_milliliter({:milliliter, quant}, :cup), do: {:cup, quant / 240}

  def from_milliliter({:milliliter, quant}, :fluid_ounce),
    do: {:fluid_ounce, quant / 30}

  def from_milliliter({:milliliter, quant}, :teaspoon), do: {:teaspoon, quant / 5}
  def from_milliliter({:milliliter, quant}, :tablespoon), do: {:tablespoon, quant / 15}

  def convert({:milliliter, quant}, unit),
    do: from_milliliter({:milliliter, quant}, unit)

  def convert({volume, quant}, unit) do
    {_, ml} = to_milliliter({volume, quant})
    from_milliliter({:milliliter, ml}, unit)
  end
end
