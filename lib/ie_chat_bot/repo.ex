defmodule IeChatBot.Repo do
  use Ecto.Repo,
    otp_app: :ie_chat_bot,
    adapter: Ecto.Adapters.Postgres
end
