# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    initial_state = %{
      plots: [],
      next_id: 1,
      deleted_ids: []
    }

    Agent.start_link(fn -> initial_state end, opts)
  end

  def list_registrations(pid) do
    state = Agent.get(pid, fn state -> state end)
    Enum.filter(state.plots, fn plots -> plots.plot_id not in state.deleted_ids end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      new_plot = %Plot{plot_id: state.next_id, registered_to: register_to}

      new_state = %{
        plots: [new_plot | state.plots],
        next_id: state.next_id + 1,
        deleted_ids: state.deleted_ids
      }

      {new_plot, new_state}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn state ->
      new_state = %{
        plots: state.plots,
        next_id: state.next_id,
        deleted_ids: [plot_id | state.deleted_ids]
      }

      {state, new_state}
    end)

    :ok
  end

  def get_registration(pid, plot_id) do
    plot = list_registrations(pid) |> Enum.find(fn plot -> plot.plot_id == plot_id end)

    if match?(%Plot{}, plot) do
      plot
    else
      {:not_found, "plot is unregistered"}
    end
  end
end
