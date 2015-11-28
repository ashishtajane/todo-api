defmodule TodoApp.Router do
  use TodoApp.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoApp do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
