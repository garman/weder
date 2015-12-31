defmodule Weder.Format do

  def darksky(raw_response) do
    raw_response
    |> Poison.Parser.parse!
    |> build_struct
    |> summary
    |> current
    |> daily
    |> hourly

    #|> darksky_current(raw_response)
  end

  defp build_struct(raw) do
    [raw, %Forecast{}]
  end

  defp summary([raw, forecast]) do
    [raw, %{forecast | summary: raw["summary"]}]
  end

  defp current([raw, forecast]) do
    [raw, %{forecast | current: raw["currently"] }]
  end

  defp daily([raw, forecast]) do
    [raw, %{forecast | daily: %{summary: raw["daily"]["summary"], icon: raw["daily"]["icon"], data: raw["daily"]["data"]} }]
  end

  defp hourly([raw, forecast]) do
    %{forecast | hourly: %{summary: raw["hourly"]["summary"], icon: raw["hourly"]["icon"], data: Enum.slice(raw["hourly"]["data"], 0, 10)}}
  end

end
