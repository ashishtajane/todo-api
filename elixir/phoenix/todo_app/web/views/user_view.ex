defmodule TodoApp.UserView do
  use TodoApp.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, TodoApp.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, TodoApp.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      hashed_password: user.hashed_password,
      hashed_confirmation_token: user.hashed_confirmation_token,
      confirmed_at: user.confirmed_at,
      hashed_password_reset_token: user.hashed_password_reset_token,
      unconfirmed_email: user.unconfirmed_email,
      authentication_tokens: user.authentication_tokens}
  end
end
