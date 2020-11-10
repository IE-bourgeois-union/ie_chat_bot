defmodule IeChatBot.TimeToMoveOut do
  use IeChatBot.Constants

  alias IeChatBot.Counters

  @regex ~r/валит|валим/i

  def call(message) do
    input_message = message_text(message)
    chat = chat_id(message)
    reply_to_id = message_id(message)
    from = from(message)

    if(Regex.match?(@regex, input_message)) do
      message = @time_to_move_out_counter_key
      |> Counters.increment(chat, from.user_id, from.username)
      |> Counters.generate_message()

      Nadia.send_message(chat, message, reply_to_message_id: reply_to_id, parse_mode: "Markdown")
    end
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
