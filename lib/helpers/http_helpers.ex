defmodule Simplificator3000.HttpHelpers do


  def sanitize_headers(headers) do
    headers
    |> Enum.filter(fn {_header, value} -> not is_nil(value) end)
    |> Enum.map(fn
      {atom, value} when is_atom(atom) and is_binary(value) ->
        {Atom.to_string(atom), value}

      {binary, value} = x when is_binary(binary) and is_binary(value) ->
        x
    end)
  end

  def merge_headers(headers, additional_headers) do
    headers
    |> Enum.concat(additional_headers)
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.put(acc, key, value)
    end)
  end
end
