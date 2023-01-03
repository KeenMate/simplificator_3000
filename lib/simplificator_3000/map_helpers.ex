defmodule Simplificator3000.MapHelpers do
  alias Simplificator3000.StringHelpers

  @spec camelize_map_keys(map) :: map
  def camelize_map_keys(struct) when is_struct(struct) do
    camelize_map_keys(Map.from_struct(struct))
  end

  def camelize_map_keys(map) when is_map(map) do
    for {key, val} <- map, into: %{} do
      {Inflex.camelize(key, :lower), camelize_map_keys(val)}
    end
  end

  def camelize_map_keys(val), do: val

  def add_prefix(map, prefix) when is_map(map) and is_bitstring(prefix) do
    Enum.map(map, &add_prefix_to_item(&1, prefix))
    |> Enum.into(%{})
  end

  defp add_prefix_to_item({key, value}, prefix) do
    {StringHelpers.add_prefix(key, prefix), value}
  end
end
