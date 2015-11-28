defmodule TodoApp.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :text, :string
      add :done, :boolean, default: false

      timestamps
    end

  end
end
