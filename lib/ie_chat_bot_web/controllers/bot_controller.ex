defmodule IeChatBotWeb.BotController do
  use IeChatBotWeb, :controller
  alias IeChatBot.TimeToMoveOut

  action_fallback IeChatBotWeb.FallbackController

  def webhook(
        conn,
        %{"message" => %{"text" => input_message, "chat" => %{"id" => chat_id}, "message_id" => message_id}}
      ) do

    TimeToMoveOut.call(chat_id, input_message, message_id)

    json(conn, %{})
  end

  def webhook(conn, _params) do
    json(conn, %{})
  end
end
