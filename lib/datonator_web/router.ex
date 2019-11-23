defmodule DatonatorWeb.Router do
  use DatonatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DatonatorWeb do
    pipe_through :api

    get "/report/eligibles", Report.EligibleController, :index
  end
end
