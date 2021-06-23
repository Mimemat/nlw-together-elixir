defmodule Wabanex.Users.Get do
  alias Wabanex.{Repo, User}

  alias Ecto.UUID

  def call(id), do: id |> UUID.cast() |> handle_response()

  defp handle_response({:ok, id}), do: User |> Repo.get(id) |> handle_get()
  defp handle_response(:error), do: {:error, "Invalid ID"}

  defp handle_get(%User{} = user), do: {:ok, user}
  defp handle_get(nil), do: {:error, "User not found"}
end
