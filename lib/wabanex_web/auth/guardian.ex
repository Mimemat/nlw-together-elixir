defmodule WabanexWeb.Auth.Guardian do
  use Guardian, otp_app: :wabanex

  alias Wabanex.{User, Users}

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> Users.Get.call()
  end

  def user_from_token(token) do
    with {:ok, claims} <- decode_and_verify(token) do
      resource_from_claims(claims)
    else
      _err -> {:error, "Invalid Token"}
    end
  end

  def authenticate(%{email: email, password: password}) do
    with {:ok, %User{password_hash: hash} = user} <- Users.Get.call_by_email(email),
         true <- Argon2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, %{token: token}}
    else
      false -> {:error, "Please, verify your credentials."}
      error -> error
    end
  end

  def authenticate(_), do: {:error, "Invalid or missing params"}
end
