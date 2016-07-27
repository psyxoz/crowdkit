# Crowdkit

An Elixir client for CrowdFlower API V2

## Installation

  1. Add crowdkit to your list of dependencies in `mix.exs`:

        def deps do
          [{:crowdkit, "~> 0.0.1"}]
        end

  2. Ensure crowdkit is started before your application:

        def application do
          [applications: [:crowdkit]]
        end

  3. Run mix do deps.get, compile
