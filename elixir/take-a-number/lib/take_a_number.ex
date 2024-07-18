defmodule TakeANumber do
  def start() do
    spawn(TakeANumber, :counter, [0])
  end

  def counter(initial_value) do
      receive do
        {:report_state, caller_pid} ->
          send(caller_pid, initial_value)
          counter(initial_value)

        {:take_a_number, caller_pid} ->
          send(caller_pid, initial_value + 1)
          counter(initial_value + 1)

        :stop ->
          Process.exit(self(), ":stop received!")

        _any -> counter(initial_value)
      end
  end
end
