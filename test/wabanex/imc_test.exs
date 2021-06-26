defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns its data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response = {:ok, %{"Diego" => 23.041, "Rafael" => 24.898}}

      assert expected_response == response
    end

    test "when the file does not exist, returns error" do
      params = %{"filename" => "inexistent.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening file"}

      assert expected_response == response
    end
  end
end
