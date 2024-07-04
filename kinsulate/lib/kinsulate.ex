defmodule Kinsulate do
  @moduledoc """
  Documentation for `Kinsulate`.
  """
  def get_args(resource) do
    metadata = K8s.Resource.metadata(resource)
    labels = K8s.Resource.labels(resource)
    resource_annotations = K8s.Resource.annotations(resource)
    annotations = get_annotations_or_defaults(resource_annotations)

    ns = K8s.Resource.namespace(resource) || "default"
    name = K8s.Resource.name(resource)

    spec = Map.get(resource, "spec")

    %{
      name: name,
      namespace: ns,
      metadata: metadata,
      annotations: annotations
      labels: labels,
      params: spec,
    }
  end

  def get_annotations_or_defaults(annotations) do
    %{}
  end
end
