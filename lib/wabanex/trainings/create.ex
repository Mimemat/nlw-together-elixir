defmodule Wabanex.Trainings.Create do
  alias Wabanex.{Training, Repo}

  def call(params), do: params |> Training.changeset() |> Repo.insert()
end
