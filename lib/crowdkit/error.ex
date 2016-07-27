defmodule Crowdkit.Error do
  defexception [:message, :status]

  def message(exception) do
    status_title(exception.status) <> ": #{exception.message}"
  end

  defp status_title(status) do
    case status do
      400 -> "Bad Request"
      401 -> "Authentication Required Error"
      403 -> "Forbidden"
      404 -> "Not Found"
      406 -> "Not Acceptable"
      409 -> "Conflict"
      415 -> "Unsupported Media Type"
      422 -> "Unprocessable Entity"
      429 -> "Too Many Requests"
      500 -> "Internal Server Error"
      501 -> "Not Implemented"
      502 -> "Bad Gateway"
      503 -> "Service Unavailable"
      _ ->
        if status > 400 && status <= 499 do
          "Client Error"
        else
          "Server Error"
        end
    end
  end
end
