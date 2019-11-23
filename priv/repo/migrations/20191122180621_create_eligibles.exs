defmodule Datonator.Repo.Migrations.CreateEligibles do
  use Ecto.Migration

  def change do
    create table(:eligibles) do
      add :name, :string
      add :email, :string
      add :employee_number, :string
      add :department, :string

      timestamps()
    end

  end
end
