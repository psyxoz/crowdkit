defmodule Crowdkit do
  def user_agent do
    Application.get_env(:crowdkit, :user_agent)
  end

  def api_endpoint do
    Application.get_env(:crowdkit, :api_endpoint)
  end
end
