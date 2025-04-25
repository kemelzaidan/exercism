defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
      end
    end
  end

  def divide(stack) do
    cond do
      length(stack) < 2 -> raise StackUnderflowError, "when dividing"
      Enum.at(stack, 0) == 0 -> raise DivisionByZeroError
      true -> Enum.reduce(stack, &//2)
    end
  end
end
