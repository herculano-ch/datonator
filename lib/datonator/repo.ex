defmodule Datonator.Repo do
  use Ecto.Repo,
    otp_app: :datonator,
    adapter: Ecto.Adapters.MyXQL
end
