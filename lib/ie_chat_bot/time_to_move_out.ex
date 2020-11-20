defmodule IeChatBot.TimeToMoveOut do
  use IeChatBot.Constants

  alias IeChatBot.Counters
  alias IeChatBot.Telegram

  @regex ~r/валит|валим/iu

  def call(message) do
    metadata = Telegram.metadata(message)

    if(Regex.match?(@regex, metadata.input_message)) do
      message = @time_to_move_out_counter_key
      |> Counters.increment(metadata.chat_id, metadata.user_id, metadata.username)
      |> Counters.generate_message()

      Nadia.send_message(metadata.chat_id, message, reply_to_message_id: metadata.message_id, parse_mode: "Markdown")
    end
  end
end
