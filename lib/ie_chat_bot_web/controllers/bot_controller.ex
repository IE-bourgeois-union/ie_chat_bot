defmodule IeChatBotWeb.BotController do
  use IeChatBotWeb, :controller
  alias IeChatBot.TimeToMoveOut

  action_fallback(IeChatBotWeb.FallbackController)

  def webhook(conn, %{"message" => message}) do
    TimeToMoveOut.call(message)

    json(conn, %{})
  end

  def webhook(conn, _params) do
    json(conn, %{})
  end
end
