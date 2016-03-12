defmodule Htap.PageController do
  use Htap.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tap(conn, _params) do
    headers = Enum.map(conn.req_headers, fn {name, value} ->
      "#{name}: #{value}<br>"
    end)

    body = conn.private[:raw_body]
    |> URI.decode_query
    |> Enum.map(fn
      {"field_values", value} ->
        "field_values: #{value |> String.split(<<0>>)}"
      {name, value} ->
      "#{name}: #{value}<br>"
    end)

    Htap.Endpoint.broadcast!("taps:first", "new_msg", %{headers: headers, body: body})
    text conn, conn.private[:raw_body]
  end
end
