defmodule Simplificator3000.RandomHelpers do
  @spec new_request_id() :: binary
  def new_request_id() do
    binary = <<
      System.system_time(:nanosecond)::64,
      :erlang.phash2({node(), self()}, 16_777_216)::24,
      :erlang.unique_integer()::32
    >>

    Base.url_encode64(binary)
  end

  @spec new_guid() :: binary
  def new_guid() do
    UUID.uuid4()
  end

  @spec get_random_int(integer, integer) :: integer
  def get_random_int(min, max) do
    min..max |> Enum.random()
  end

  @spec get_random_groups(integer, integer, integer, integer) :: binary
  def get_random_groups(min \\ 1, max \\ 1000, padding \\ 3, count \\ 3) do
    1..count
    |> Enum.map(fn _ -> get_random_int(min, max) end)
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(fn n -> String.pad_leading(n, padding, "0") end)
    |> Enum.join("-")
  end

  @spec get_random_number(integer, integer, integer) :: binary
  def get_random_number(min \\ 1, max \\ 999_999, padding \\ 6) do
    get_random_int(min, max)
    |> then(&Integer.to_string/1)
    |> then(fn n -> String.pad_leading(n, padding, "0") end)
  end

  @spec random_string(integer) :: binary
  def random_string(length) do
    length
    |> :crypto.strong_rand_bytes()
    |> Base.encode64()
    |> binary_part(0, length)
  end
end
