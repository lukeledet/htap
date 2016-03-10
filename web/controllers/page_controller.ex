defmodule Htap.PageController do
  use Htap.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
