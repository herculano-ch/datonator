defmodule Datonator.User.Eligible do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eligibles" do
    field :department, :string
    field :email, :string
    field :employee_number, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(eligible, attrs) do
    eligible
    |> cast(attrs, [:name, :email, :employee_number, :department])
    |> validate_required([:name, :email, :employee_number])
  end
end
