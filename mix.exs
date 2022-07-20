defmodule Simplificator3000.MixProject do
  use Mix.Project

  def project do
    [
      app: :simplificator_3000,
      version: "0.1.2",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      name: "Simplificator3000",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def description() do
    "Make your life in Elixir easier"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "simplificator_3000",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/KeenMate/simplificator_3000"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:inflex, "2.1.0"},
      {:uuid, "1.1.8"}
    ]
  end
end
