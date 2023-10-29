defmodule Simplificator3000.MapHelpersTest do
  use ExUnit.Case
  doctest Simplificator3000.MapHelpers

  test "snake case map keys" do
    struct = %{
      "camelCase" => "camelCase",
      "Snake_case" => "snake_case",
      "snake_case" => %{
        "camelCase" => "camelCase",
        "snake_case" => "snake_case"
      }
    }

    expected = %{
      "camel_case" => "camelCase",
      "snake_case" => "snake_case",
      "snake_case" => %{
        "camel_case" => "camelCase",
        "snake_case" => "snake_case"
      }
    }

    assert Simplificator3000.MapHelpers.snake_cased_map_keys(struct) == expected
  end

  test "dont break structs" do
    input = %File.Stat{
      access: :read,
      size: 12345
    }

    expected = %File.Stat{
      access: :read,
      size: 12345
    }

    assert Simplificator3000.MapHelpers.snake_cased_map_keys(input) == expected
  end
end
