defmodule Crowdkit.Client.Jobs do
  import Crowdkit.Request

  def find(id),                   do: get("jobs/#{id}")
  def all(opts \\ []),            do: get("jobs", opts)
  def create(opts \\ []),         do: post("jobs", opts)
  def copy(id, opts \\ []),       do: post("jobs/#{id}/copy", opts)
  def order(id, opts \\ []),      do: post("jobs/#{id}/order", opts)
  def statuses(id, opts \\ []),   do: get("jobs/#{id}/statuses", opts)
  def judgments(id, opts \\ []),  do: get("jobs/#{id}/judgments", opts)
end
