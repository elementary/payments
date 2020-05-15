defmodule PaymentsWeb.Router do
  use PaymentsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PaymentsWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PaymentsWeb do
    pipe_through :browser

    live "/", PageLive, :index

    live "/payments", PaymentLive.Index, :index
    live "/payments/:id", PaymentLive.Show, :show
    live "/payments/new/:project_id", PaymentLive.New, :new

    resources "/projects", ProjectController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PaymentsWeb do
  #   pipe_through :api
  # end
end
