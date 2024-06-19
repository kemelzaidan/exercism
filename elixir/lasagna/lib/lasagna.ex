defmodule Lasagna do
  def expected_minutes_in_oven, do: 40
  def remaining_minutes_in_oven(time), do: 40 - time
  def preparation_time_in_minutes(layers), do: layers * 2
  def total_time_in_minutes(layers, time) do
    preparation_time_in_minutes(layers) + time
  end
    def alarm, do: "Ding!"
end
