defmodule Datonator do
  @moduledoc """
  Datonator keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.

  """

  def create_eligibles() do
    dt = NaiveDateTime.truncate(NaiveDateTime.utc_now, :second)

    1..5000
    |> Enum.map(fn _ ->
      %{
        name: Faker.Name.name,
        email: Faker.Internet.free_email,
        employee_number: Faker.Code.iban("AL", ["ABNA"]),
        department: Faker.Industry.sector,
        inserted_at: dt,
        updated_at: dt,
      }
    end)
    |> Datonator.User.create_eligibles()

  end
end
