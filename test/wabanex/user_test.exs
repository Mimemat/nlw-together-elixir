defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all parameters are correct, returns valid changeset" do
      params = %{name: "John doe", email: "john@doe.com", password: "123456"}

      response = params |> User.changeset()

      assert %Ecto.Changeset{valid?: true, errors: []} = response
    end

    test "when parameters are invalid, returns invalid changeset" do
      params = %{name: "J", email: "invalid email", password: "12345"}

      response = params |> User.changeset()

      assert %Ecto.Changeset{valid?: false} = response

      assert length(response.errors) == 3
    end
  end
end
