defmodule Simplificator3000.MixProject do
  use Mix.Project

  def project do
    [
      app: :simplificator_3000,
      version: "0.5.5",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      name: "Simplificator3000",
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def description() do
    "Make your life in Elixir easier"
  end

  defp package() do
    [
      name: "simplificator_3000",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/KeenMate/simplificator_3000"},
      source_url: "https://github.com/KeenMate/simplificator_3000"
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.27", runtime: false},
      {:inflex, "~> 2.1.0"},
      {:uuid, "~> 1.1.8"},
      {:httpoison, "~> 2.1"}
    ]
  end
end
