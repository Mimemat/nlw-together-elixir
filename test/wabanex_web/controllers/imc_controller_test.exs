defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns imc", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{"Diego" => 23.041, "Rafael" => 24.898}
      }

      assert response == expected_response
    end

    test "when params are invalid, returns error", %{conn: conn} do
      params = %{"filename" => "invalid.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening file"}

      assert response == expected_response
    end
  end
end
