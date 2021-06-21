defmodule Wabanex.IMC do
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    {:ok,
     content
     |> String.split("\n")
     |> Enum.map(&parse_line(&1))
     |> Enum.into(%{})}
  end

  defp handle_file({:error, _reason}) do
    {:error, "Error while opening file"}
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    |> IO.inspect()
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  defp calculate_imc([name, height, weight]),
    do: {name, Float.ceil(weight / :math.pow(height, 2), 3)}
end
