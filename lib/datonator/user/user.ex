defmodule Datonator.User do

  #import Ecto.Query

  alias Datonator.Repo
  alias Datonator.User.Eligible

  def get_eligibles_with_stream(callback) do
    Repo.transaction(fn ->
      stream = Repo.stream(Eligible)
      callback.(stream)
    end)
  end

  def create_eligibles(data) do
    Repo.insert_all(Eligible, data)
  end
end
