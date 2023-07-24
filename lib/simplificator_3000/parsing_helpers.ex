defmodule Simplificator3000.ParsingHelpers do
  def parse_float(str) when is_binary(str) do
    String.to_float(str)
  end

  def parse_float(float) when is_float(float) do
    float
  end

  def parse_float(int) when is_integer(int) do
    int + 0.0
  end

  def parse_float(_) do
    nil
  end

  def to_integer(nil), do: nil

  def to_integer(number) when is_number(number) do
    number
  end

  def to_integer(binary) when is_binary(binary) do
    String.to_integer(binary)
  end

  def sanitize_string(nil) do
    nil
  end

  def sanitize_string(str) do
    String.trim(str)
  end
end
