defmodule Simplificator3000.EnumHelpers do
  @moduledoc """
  This module contains functions for easier work with enumerables.
  """

  @doc """
  Checks whether all `sub_list` items are present within `source_list` using simple `&==/2` operator.

  Returns `true` if all elements in `sub_list` are found in `source_list`.

  ## Examples

    iex> Simplificator3000.EnumHelpers.contains_all?([:a, :b, :c], [:a, :b])
    true

    iex> Simplificator3000.EnumHelpers.contains_all?([:a, :b, :c], [:a, :d])
    false
  """

  @spec contains_all?(list(any), list(any)) :: boolean
  def contains_all?(source_list, sub_list) do
    Enum.all?(sub_list, &(&1 in source_list))
  end

  @doc """
  Checks whether at least one `sub_list` element is present in `source_list` using simple `&==/2` operator.

  Returns `true` if at least one element in `sub_list` is found in `source_list`.

  ## Examples

    iex> Simplificator3000.EnumHelpers.contains_any?([:a, :b, :c], [:a, :d])
    true

    iex> Simplificator3000.EnumHelpers.contains_any?([:a, :b, :c], [:d, :e])
    false
  """

  @spec contains_any?(list(any), list(any)) :: boolean
  def contains_any?(source_list, sub_list) do
    Enum.any?(sub_list, &(&1 in source_list))
  end
end
