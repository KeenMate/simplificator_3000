defmodule Simplificator3000.MapHelpers do
  alias Simplificator3000.StringHelpers

  def camel_cased_map_keys(%DateTime{} = val), do: val

  def camel_cased_map_keys(%Time{} = val), do: val

  def camel_cased_map_keys(%Date{} = val), do: val

  def camel_cased_map_keys(struct) when is_struct(struct) do
    struct
    |> Map.from_struct()
    |> camel_cased_map_keys()
  end

  def camel_cased_map_keys(%{} = map) do
    for {key, val} <- map, into: %{} do
      {Inflex.camelize(key, :lower), camel_cased_map_keys(val)}
    end
  end

  def camel_cased_map_keys(list) when is_list(list) do
    Enum.map(list, &camel_cased_map_keys/1)
  end

  def camel_cased_map_keys(val), do: val

  def snake_cased_map_keys(%{} = map) do
    for {key, val} <- map, into: %{} do
      {StringHelpers.underscore(key), snake_cased_map_keys(val)}
    end
  end

  def snake_cased_map_keys(list) when is_list(list) do
    Enum.map(list, &snake_cased_map_keys/1)
  end

  def snake_cased_map_keys(val), do: val

  def add_prefix(map, prefix) when is_map(map) and is_bitstring(prefix) do
    Enum.map(map, &add_prefix_to_item(&1, prefix))
    |> Enum.into(%{})
  end

  defp add_prefix_to_item({key, value}, prefix) do
    {StringHelpers.add_prefix(key, prefix), value}
  end

  @doc """
  DONT USE FOR USER INPUT
  It uses String.to_atom which is not safe for user input.
  Converts all keys of a map to atoms.
  """
  def keys_to_atoms(json) when is_map(json) do
    Map.new(json, &reduce_keys_to_atoms/1)
  end

  defp reduce_keys_to_atoms({key, val}) when is_map(val),
    do: {String.to_atom(key), keys_to_atoms(val)}

  defp reduce_keys_to_atoms({key, val}), do: {String.to_atom(key), val}
end
