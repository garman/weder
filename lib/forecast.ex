defmodule Forecast do

  defstruct summary: "",
            current: %{},
            daily: %{summary: "", icon: "", data: []},
            hourly: %{summary: "", icon: "", data: []}
end
