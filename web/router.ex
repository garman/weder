defmodule Weder.Router do
  use Weder.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Weder do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/darksky", DarkskyController, :new
    get "/darksky_forecast", DarkskyController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Weder do
  #   pipe_through :api
  # end
end
