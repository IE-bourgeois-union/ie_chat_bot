defmodule IeChatBot.TimeToMoveOut do
  @regex ~r/валить/i
  def call(chat_id, input_message, message_id) do
    if(Regex.match?(@regex, input_message)) do
      Nadia.send_message(chat_id, "вали", reply_to_message_id: message_id)
    end
  end
end
