defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &Map.fetch(&1, :price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names([], _old_word, _new_word) do
    []
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn map ->
      Map.put(map, :name, String.replace(map[:name], old_word, new_word))
    end)
  end

  def increase_quantity(item, count) when item.quantity_by_size == %{} do
    item
  end

  def increase_quantity(item, count) do
    quantities = Enum.into(item.quantity_by_size, %{}, fn {s, q} -> {s, q + count} end)
    %{item | quantity_by_size: quantities}
  end
  
  def total_quantity(item) do
    if item.quantity_by_size == %{} do
      0
    else
      item.quantity_by_size |> Enum.reduce(0, fn {_size, quantity}, acc ->
        acc + quantity end)
    end
  end
end
