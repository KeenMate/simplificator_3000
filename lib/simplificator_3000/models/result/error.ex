defmodule Simplificator3000.Result.Error do
  @keys [:reason, :message, :metadata]

  defstruct @keys

  @type t() :: t(atom())

  @type t(reason) :: %__MODULE__{
          reason: reason,
          message: binary() | nil,
          metadata: map() | nil
        }
end
