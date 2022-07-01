defmodule Simplificator3000.EnumHelpers do
  @doc """
  Returns whether a sub_list is contained within source_list using simple &==/2 operator
  """
  def logical_and(source_list, sub_list) when is_list(source_list) and is_list(sub_list) do
    Enum.all?(sub_list, &(&1 in source_list))
  end

  @doc """
  Returns whether any sub_list element is ini source_list using simple &==/2 operator
  """
  def logical_or(source_list, sub_list) when is_list(source_list) and is_list(sub_list) do
    Enum.any?(sub_list, &(&1 in source_list))
  end
end
