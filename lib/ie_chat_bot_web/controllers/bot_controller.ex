defmodule IeChatBotWeb.BotController do
  use IeChatBotWeb, :controller
  alias IeChatBot.{TimeToMoveOut, Rechickoe, IStay, Pohui}

  action_fallback(IeChatBotWeb.FallbackController)

  def webhook(conn, %{"message" => message}) do
    TimeToMoveOut.call(message)
    Rechickoe.call(message)
    IStay.call(message)
    Pohui.call(message)

    json(conn, %{})
  end

  def webhook(conn, _params) do
    json(conn, %{})
  end
end
