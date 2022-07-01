defmodule Simplificator3000.RandomHelpers do
  def new_request_id() do
    binary = <<
      System.system_time(:nanosecond)::64,
      :erlang.phash2({node(), self()}, 16_777_216)::24,
      :erlang.unique_integer()::32
    >>

    Base.url_encode64(binary)
  end

  def new_guid() do
    UUID.uuid1()
  end

  def get_random_int(min, max) do
    min..max |> Enum.random()
  end

  def get_random_groups(min \\ 1, max \\ 1000, padding \\ 3, count \\ 3) do
    1..count
    |> Enum.map(fn _ -> get_random_int(min, max) end)
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(fn n -> String.pad_leading(n, padding, "0") end)
    |> Enum.join("-")
  end

  def get_random_number(min \\ 1, max \\ 999999, padding \\ 6) do
    get_random_int(min, max)
    |> then(&Integer.to_string/1)
    |> then(fn n -> String.pad_leading(n, padding, "0") end)
  end

  def random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.encode64() |> binary_part(0, length)
  end
end
