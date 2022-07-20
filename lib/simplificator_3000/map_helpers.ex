defmodule Simplificator3000.MapHelpers do
  @spec camelize_map_keys(map) :: map
  def camelize_map_keys(map) when is_map(map) do
    for {key, val} <- map, into: %{} do
      {Inflex.camelize(key, :lower), camelize_map_keys(val)}
    end
  end

  def camelize_map_keys(val), do: val
end
