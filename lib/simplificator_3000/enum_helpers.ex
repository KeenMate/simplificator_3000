defmodule Simplificator3000.EnumHelpers do
  @moduledoc """
  This module contains functions for easier work with enumerables.
  """

  @doc """
  Returns `true` if all elements in `sub_list` are present in `source_list`.
  
  Presence is checked using `Kernel.in/2`.
  
  ## Examples
  
      iex> Simplificator3000.EnumHelpers.contains_all?([:a, :b, :c], [:a, :b])
      true
  
      iex> Simplificator3000.EnumHelpers.contains_all?([:a, :b, :c], [:a, :d])
      false
  
  """

  @spec contains_all?(Enum.t(), Enum.t()) :: boolean
  def contains_all?(source_list, sub_list) do
    Enum.all?(sub_list, &(&1 in source_list))
  end

  @doc """
  Returns `true` if at least one element in `sub_list` is present in `source_list`.
  
  Presence is checked using `Kernel.in/2`.
  
  ## Examples
  
      iex> Simplificator3000.EnumHelpers.contains_any?([:a, :b, :c], [:a, :d])
      true
  
      iex> Simplificator3000.EnumHelpers.contains_any?([:a, :b, :c], [:d, :e])
      false
  
  """

  @spec contains_any?(Enum.t(), Enum.t()) :: boolean
  def contains_any?(source_list, sub_list) do
    Enum.any?(sub_list, &(&1 in source_list))
  end
end
