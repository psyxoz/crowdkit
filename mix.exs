defmodule Crowdkit.Mixfile do
  use Mix.Project

  @description """
    An Elixir client for CrowdFlower API V2
  """

  def project do
    [
      app: :crowdkit,
      version: "0.0.1",
      elixir: "~> 1.2",
      name: "Crowdkit",
      description: @description,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      package: package
    ]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:logger, :httpoison, :exjsx]]
  end

  # Dependencies can be Hex packages
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      { :httpoison, "~> 0.8.0" },
      { :exjsx, "~> 3.2" }
    ]
  end

  defp package do
    [
      maintainers: ["Sergey Homenko"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/psyxoz/crowdkit" }
    ]
  end
end
