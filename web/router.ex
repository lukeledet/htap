defmodule Htap.Router do
  use Htap.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Htap do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/tap", PageController, :tap
  end

  # Other scopes may use custom stacks.
  # scope "/api", Htap do
  #   pipe_through :api
  # end
end
