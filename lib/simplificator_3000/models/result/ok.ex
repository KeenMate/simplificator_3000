defmodule Simplificator3000.Result.Ok do
  @type t(data) :: %__MODULE__{
          data: data,
          metadata: map() | nil
        }

  defstruct [:data, {:metadata, nil}]

  def new(data, metadata \\ nil) do
    %__MODULE__{
      data: data,
      metadata: metadata
    }
  end

  def get_data(%__MODULE__{} = ok) do
    ok.data
  end

  def get_metadata(%__MODULE__{} = ok, key, default_value \\ nil) do
    get_in(ok, ~w(metadata #{key})a) || default_value
  end

  def get_metadata!(%__MODULE__{} = ok, key) do
    case ok.metadata do
      %{^key => value} ->
        value

      _ ->
        raise %KeyError{
          term: ok,
          key: key,
          message: "Given key not found in metadata of #{__MODULE__} struct"
        }
    end
  end
end
