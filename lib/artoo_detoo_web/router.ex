defmodule ArtooDetooWeb.Router do
  use ArtooDetooWeb, :router

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

  scope "/", ArtooDetooWeb do
    pipe_through :browser

    get "/", PageController, :index

    post "/check", NnController, :check
  end

  # Other scopes may use custom stacks.
  # scope "/api", ArtooDetooWeb do
  #   pipe_through :api
  # end
end
