defmodule Weder.PageController do
  use Weder.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
