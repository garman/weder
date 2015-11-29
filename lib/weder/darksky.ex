defmodule Weder.Darksky do
  def by_lat_long(lat, long, time, options) do
    api_key
    |> Darksky.forecast(lat, long, time, options)
  end

  def by_lat_long(lat, long, options) do
    api_key
    |> Darksky.forecast(lat, long, options)
  end

  def by_address(address, options) do
    address
    |> Geocoder.call
    |> format_lat_long(options)
  end

  def by_address(address, time, options) do
    address
    |> Geocoder.call
    |> format_lat_long(time, options)
  end

  def random_forecast(options) do
    api_key
    |> Darksky.forecast(rand_float(91), rand_float(181), options)
  end

  def random_forecast(time, options) do
    api_key
    |> Darksky.forecast(rand_float(91), rand_float(181), time, options)
  end

  defp api_key do
    Application.get_env(:weder, Weder.Endpoint)[:darksky_api_key]
  end

  defp rand_float(num) do
    num
    |> generate_random
    |> Float.round(6)
  end

  defp generate_random(num) do
    :random.uniform + :random.uniform(num) - 1
  end

  defp format_lat_long({:ok, resp}, time, options) do
    api_key
    |> Darksky.forecast(resp.lat, resp.lon, time, options)
  end
  defp format_lat_long({:ok, resp}, options) do
    api_key
    |> Darksky.forecast(resp.lat, resp.lon, options)
  end

  defp format_lat_long({:error, _resp}, _options) do
    ''
  end
  defp format_lat_long({:error, _resp}, _time, _options) do
    ''
  end
end
