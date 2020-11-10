defmodule IeChatBot.Constants do
  defmacro __using__(_) do
    quote do
      @time_to_move_out_counter_key "time_to_move_out"
      @rechickoe_counter_key "rechickoe"
    end
  end
end
