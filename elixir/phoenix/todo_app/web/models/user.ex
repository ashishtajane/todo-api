defmodule TodoApp.User do
  use TodoApp.Web, :model

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :hashed_confirmation_token, :string
    field :confirmed_at, Ecto.DateTime
    field :hashed_password_reset_token, :string
    field :unconfirmed_email, :string
    field :authentication_tokens, {:array, :string}, default: []

    timestamps
  end

  @required_fields ~w(email hashed_password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
