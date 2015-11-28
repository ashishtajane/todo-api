defmodule TodoApp.Router do
  use TodoApp.Web, :router
  require PhoenixTokenAuth

  pipeline :authenticated do
    plug PhoenixTokenAuth.Plug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    PhoenixTokenAuth.mount
  end

  scope "/api", TodoApp do
    pipe_through :authenticated
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit, :create]
  end
end
