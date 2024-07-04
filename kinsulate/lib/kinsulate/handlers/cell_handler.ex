defmodule Kinsulate.Handlers.CellHandler do
  @moduledoc """
  `CellHandler` handles ActiCellvator CRD events
  """
  alias Kinsulate.K8s.Cells.K8sCell

  @behaviour Pluggable

  @impl Pluggable
  def init(_opts), do: nil

  @impl Pluggable
  def call(%Bonny.Axn{action: action, resource: resource} = axn, nil) do
    Kinsulate.get_args(resource)
    |> K8sCell.apply(axn, action)
  end
end
