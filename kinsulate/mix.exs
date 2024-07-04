defmodule Kinsulate.MixProject do
  use Mix.Project

  @app :kinsulate
  @version "0.1.0"
  @description "KInsulate is Kubernetes simple Cell Basead Architecture implementation to better workload isolation."
  @site "https://kinsulate.io"
  @source_url "https://github.com/sleipnir/kinsulate"

  def project do
    [
      app: @app,
      version: @version,
      description: @description,
      source_url: @source_url,
      homepage_url: @site,
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      package: package(),
      releases: releases(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Kinsulate.Application, []}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "priv", "README.md", "LICENSE"],
      licenses: ["Apache-2.0"],
      links: %{GitHub: @source_url, Site: @site}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatter_opts: [gfm: true],
      extras: [
        "README.md"
      ]
    ]
  end

  defp deps do
    [
      {:bandit, "~> 1.1"},
      {:bakeware, ">= 0.0.0", runtime: false},
      {:bonny, "~> 1.1"},
      {:castore, "~> 1.0"}
    ]
  end

  defp elixirc_paths(:test),
    do: ["lib", "test/support"]

  defp elixirc_paths(_), do: ["lib"]

  defp releases do
    [
      kinsulate: [
        include_executables_for: [:unix],
        applications: [kinsulate: :permanent],
        steps: [
          :assemble,
          &Bakeware.assemble/1
        ],
        bakeware: [compression_level: 19]
      ]
    ]
  end
end
