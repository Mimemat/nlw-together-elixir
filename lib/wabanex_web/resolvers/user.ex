defmodule WabanexWeb.Resolvers.User do
  alias WabanexWeb.Auth.Guardian

  def get(%{id: user_id}, _context), do: Wabanex.Users.Get.call(user_id)
  def create(%{data: user_data}, _context), do: Wabanex.Users.Create.call(user_data)

  def login(params, _context), do: Guardian.authenticate(params)
end
