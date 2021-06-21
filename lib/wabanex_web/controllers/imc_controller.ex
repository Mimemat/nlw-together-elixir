defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller

  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  defp handle_response({:ok, data}, conn), do: render_response(conn, data, :ok)

  defp handle_response({:error, reason}, conn), do: render_response(conn, reason, :error)

  defp render_response(conn, result, status) do
    conn
    |> json(%{result: result})
    |> put_status(status)
  end
end
