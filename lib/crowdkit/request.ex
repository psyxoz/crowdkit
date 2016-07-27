defmodule Crowdkit.Request do
  use HTTPoison.Base

  def get(path, params \\ []) do
    _request(:get, add_params_to_path(path, params))
  end

  def post(path, body \\ "") do
    _request(:post, path, body)
  end

  def put(path, body \\ "") do
    _request(:put, path, body)
  end

  def patch(path, body \\ "") do
    _request(:patch, path, body)
  end

  def delete(path, body \\ "") do
    _request(:delete, path, body)
  end

  def _request(method, path, body \\ "") do
    url = Application.get_env(:crowdkit, :api_endpoint) <> path
    request!(method, url, JSX.encode!(body), headers()) |> process_response
  end

  defp headers do
    [
      {"Authorization", "Token token=#{access_token()}"},
      {"Accept", "application/json"},
      {"Content-Type", "application/json"},
      {"User-Agent", Application.get_env(:crowdkit, :user_agent)}
    ]
  end

  defp access_token do
    System.get_env("CROWDKIT_ACCESS_TOKEN") || Application.get_env(:crowdkit, :access_token)
  end

  defp add_params_to_path(path, params) do
    <<path :: binary, build_query_string(params) :: binary>>
  end

  defp build_query_string([]), do: ""
  defp build_query_string(params), do: to_string('?' ++ URI.encode_query(params))

  defp process_response(%HTTPoison.Response{status_code: 200, body: ""}), do: nil
  defp process_response(%HTTPoison.Response{status_code: 200, body: body}), do: JSX.decode!(body)
  defp process_response(%HTTPoison.Response{status_code: status_code, body: ""}), do: { status_code, nil }
  defp process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, JSX.decode!(body) }
end
