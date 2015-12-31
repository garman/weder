defmodule Weder.DarkskyController do
  use Weder.Web, :controller
  import Weder.Darksky
  import Weder.Format, only: [darksky: 1]

  def new(conn, _params) do
    render conn, "new.html"
  end

  def show(conn, %{"forecast" => %{"address" => address}}) do
    render conn, "show.html", forecast: Weder.Format.darksky(Weder.Darksky.by_address(address, %{}).body)
  end

  def show(conn, %{"forecast" => %{"latitude" => lat, "longitude" => long}}) do
    render conn, "show.html", forecast: Weder.Darksky.by_lat_long(lat, long, %{}).body
  end

  def show(conn, %{}) do
    render conn, "show.html", forecast: Weder.Darksky.random_forecast(%{}).body
  end
end
