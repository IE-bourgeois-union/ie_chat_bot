defmodule IeChatBot.Telegram do
  def metadata(message) do
    from = from(message)

    %{
      input_message: message_text(message),
      chat_id: chat_id(message),
      message_id: message_id(message),
      username: from.username,
      user_id: from.user_id
    }
  end

  defp chat_id(%{"chat" => %{"id" => chat}}), do: chat

  defp message_text(%{"text" => message}), do: message
  defp message_text(_message), do: ""

  defp message_id(%{"message_id" => id}), do: id

  defp from(%{"from" => from}) do
    %{
      username: from["first_name"] || from["username"],
      user_id: from["id"]
    }
  end
end
