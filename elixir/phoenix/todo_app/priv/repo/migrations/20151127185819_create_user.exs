defmodule TodoApp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :hashed_password, :string
      add :hashed_confirmation_token, :string
      add :confirmed_at, :datetime
      add :hashed_password_reset_token, :string
      add :unconfirmed_email, :string
      add :authentication_tokens, {:array, :string}

      timestamps
    end

  end
end
