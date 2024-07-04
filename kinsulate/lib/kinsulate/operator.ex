defmodule KInsulate.Operator do
  use Bonny.Operator, default_watch_namespace: :all

  step(Bonny.Pluggable.Logger)
  step(:delegate_to_controller)
  step(Bonny.Pluggable.ApplyStatus)
  step(Bonny.Pluggable.ApplyDescendants)

  def crds() do
    [
      Bonny.API.CRD.new!(
        names: Bonny.API.CRD.kind_to_names("Cell", ["cell", "ce", "cells"]),
        group: "kinsulate.io",
        scope: :Namespaced,
        versions: [KInsulate.Versions.Api.V1.Activator]
      )
    ]
  end

  def controllers(watch_namespace, _opts) do
    [
      %{
        query: K8s.Client.watch("kinsulate/v1", "Cell", namespace: watch_namespace),
        controller: KInsulate.Controllers.CellController
      }
    ]
  end
end
