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
    "Make your life in Phoenix easier"
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
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
