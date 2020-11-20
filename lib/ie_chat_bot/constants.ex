defmodule IeChatBot.Constants do
  defmacro __using__(_) do
    quote do
      @time_to_move_out_counter_key "time_to_move_out"
      @rechickoe_counter_key "rechickoe"
      @i_stay_counter_key "i_sta"
      @pohui_counter_key "pohui"
    end
  end
end
