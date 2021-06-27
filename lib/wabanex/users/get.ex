defmodule Wabanex.Users.Get do
  import Ecto.Query

  alias Wabanex.{Repo, User, Training}

  alias Ecto.UUID

  def call(id), do: id |> UUID.cast() |> handle_response()
  def call_by_email(email), do: User |> Repo.get_by(%{email: email}) |> handle_get()

  defp handle_response({:ok, id}), do: User |> Repo.get(id) |> handle_get()
  defp handle_response(:error), do: {:error, "Invalid ID"}

  defp handle_get(%User{} = user), do: {:ok, user |> load_training}
  defp handle_get(nil), do: {:error, "User not found"}

  defp load_training(user) do
    today = Date.utc_today()

    query =
      from training in Training,
        where: ^today >= training.start_date and ^today <= training.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
