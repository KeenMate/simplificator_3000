defmodule Simplificator3000.Result do
  alias Simplificator3000.Result.{Ok, Error}

  @type t() :: Ok.t() | Error.t()

  @spec with_ok(__MODULE__.t(), (Ok.t() -> any())) :: Result.t()
  @doc """
  Calls given `fun` with provided result only if it is `Ok` result.
  Outcome of the given function is wrapped in `Ok` result if it is not already a valid result struct

  ## Examples

      iex> ok = %#{Ok}{data: 123}
      iex> #{__MODULE__}.with_ok(ok, & &1.data * 2)
      %#{Ok}{data: 246}

      iex> ok = %#{Ok}{data: 123}
      iex> #{__MODULE__}.with_ok(ok, & %#{Ok}{data: "Hello #\{&1.data}"})
      %#{Ok}{data: "Hello 123"}

      iex> ok = %#{Ok}{data: 123}
      iex> #{__MODULE__}.with_ok(ok, fn _ -> %#{Error}{reason: :just_crashed} end)
      %#{Error}{reason: :just_crashed}

      iex> error = %#{Error}{reason: :nothing}
      iex> #{__MODULE__}.with_ok(error, & &1.data * 2)
      %#{Error}{reason: :nothing}
  """
  def with_ok(%Ok{} = result, fun) do
    case fun.(result) do
      %Ok{} = new_result ->
        new_result

      %Error{} = new_result ->
        new_result

      new_result ->
        %Ok{data: new_result}
    end
  end

  def with_ok(result, _fun) do
    result
  end
end
