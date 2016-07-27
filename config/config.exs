# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :crowdkit, [
  per_page: 10,
  auto_paginate: false,
  access_token: "",
  api_endpoint: "https://api.crowdflower.com/v2/",
  user_agent: "Crowdkit Elixir"
]

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :crowdkit, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:crowdkit, :key)
#
