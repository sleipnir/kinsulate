defmodule KinsulateCtl.MixProject do
  use Mix.Project

  @app :kinsulate_ctl
  @version "0.1.0"
  @description "KInsulate CLI tool."

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {KinsulateCtl.Application, []}
    ]
  end

  defp deps do
    [
      {:burrito, "~> 1.0"},
      {:do_it, "~> 0.6"},
      {:exmoji, "~> 0.3"},
      {:file_system, "~> 1.0"},
      {:jason, "~> 1.4"},
      {:k8s, "~> 2.6"},
      {:req, "~> 0.4"},
      # Non runtime deps
      {:credo, "~> 1.6", runtime: false}
    ]
  end

  def releases do
    [
      spawnctl: [
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            linux: [os: :linux, cpu: :x86_64],
            linux_musl: [os: :linux, cpu: :x86_64, libc: :musl]
            # macos: [os: :darwin, cpu: :x86_64],
            # windows: [os: :windows, cpu: :x86_64]
          ]
        ]
      ]
    ]
  end
end
