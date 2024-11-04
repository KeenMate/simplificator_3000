defmodule Simplificator3000.Helpers.PipelineHelpers do

  @spec pif(term(), term(), any(), keyword()) :: term()
  @doc """
  A pipeline-if. This macro can be  placed into the pipeline to wrap given body with a given condition so that the body is called only
  upon successful condition. Else branch can be supplied for alternate actions with the pipeline value.

  ## Parameters
    * `ctx` - Passed from pipeline.
    * `ctx_var` - Your alias for the from-pipeline given value (supports unwrapping `like %{hello: world} = x`)
    * `condition` - Regular condition that is passed as-is to the `Kernel.if`
    * `opts` - Pass `do` and (optionally) `else` blocks to your liking (these are as well passed to `Kernel.if` as-is)

  ## Examples
      iex> x = %{hello: :world}
      iex> x |>
      ...> pif %{hello: hello_value} = x_alias, hello_value == :world do
      ...>   Map.put(x_alias, :result, {hello_value, :yes})
      ...> else
      ...>   Map.put(x_alias, :result, {hello_value, :no})
      ...> end
      %{hello: :world, result: {:world, :yes}}

      iex> x = %{hello: :world}
      iex> x |>
      ...> pif %{hello: hello_value} = x_alias, hello_value == :invalid do
      ...>   Map.put(x_alias, :result, {hello_value, :yes})
      ...> else
      ...>   Map.put(x_alias, :result, {hello_value, :no})
      ...> end
      %{hello: :world, result: {:world, :no}}

      iex> x = %{hello: :world}
      iex> x |>
      ...> pif %{hello: hello_value} = x_alias, hello_value == :invalid do
      ...>   Map.put(x_alias, :result, {hello_value, :yes})
      ...> end
      x
  """
  defmacro pif(ctx, ctx_var, condition, opts) do
    do_block = opts[:do]
    else_block = opts[:else]
    else_ctx =
      if else_block do
        quote do
          unquote(ctx_var) = unquote(ctx)
        end
      end

    quote do
      Kernel.if ((unquote(ctx_var) = unquote(ctx)) || true) && unquote(condition) do
        unquote(do_block)
      else
        unquote(else_ctx)
        unquote(else_block || ctx)
      end
    end
  end
end
