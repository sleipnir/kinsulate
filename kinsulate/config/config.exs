import Config

config :bonny,
  # Add each Controller module for this operator to load here
  # Defaults to none. This *must* be set.
  controllers: [],

  # Function to call to get a K8s.Conn object.
  # The function should return a %K8s.Conn{} struct or a {:ok, %K8s.Conn{}} tuple
  get_conn: {KInsulate.K8sConn, :get, [config_env()]},

  # Set the Kubernetes API group for this operator.
  group: "kinsulate.io",

  # Name must only consist of only lowercase letters and hyphens.
  # Defaults to hyphenated mix app name
  operator_name: "kinsulate",

  # Name must only consist of only lowercase letters and hyphens.
  # Defaults to hyphenated mix app name
  service_account_name: "kinsulate",

  # Labels to apply to the operator's resources.
  labels: %{},

  # Operator deployment resources. These are the defaults.
  resources: %{limits: %{cpu: "200m", memory: "200Mi"}, requests: %{cpu: "200m", memory: "200Mi"}},
  manifest_override_callback: &Mix.Tasks.Bonny.gen.manifest.KInsulateCustomizer.override/1

import_config "#{config_env()}.exs"
