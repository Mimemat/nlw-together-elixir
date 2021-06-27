defmodule WabanexWeb.Resolvers.Training do
  alias Wabanex.{User, Trainings}

  alias WabanexWeb.Auth.Guardian

  def create(%{token: token, data: training_data}, _context) do
    with {:ok, %User{id: user_id}} <- Guardian.user_from_token(token) do
      training_data
      |> Map.put(:user_id, user_id)
      |> Trainings.Create.call()
    else
      {:error, err} -> {:error, err}
    end
  end
end
