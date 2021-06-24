defmodule WabanexWeb.Resolvers.Training do
  def create(%{data: training_data}, _context), do: Wabanex.Trainings.Create.call(training_data)
end
