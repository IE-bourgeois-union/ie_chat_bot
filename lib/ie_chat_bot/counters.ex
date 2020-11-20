defmodule IeChatBot.Counters do
  import Ecto.Query, warn: false
  use IeChatBot.Constants

  alias IeChatBot.Repo
  alias IeChatBot.Counters.Counter

  def increment(counter_key, chat_id, user_id, username) do
    attrs = %{
      chat_id: chat_id,
      counter_key: counter_key,
      user_id: user_id,
      username: username
    }

    {:ok, counter} = create_counter(attrs)

    counter
  end

  def generate_message(counter) do
    number_of_counters_today = count_today_counters(
      counter.counter_key,
      counter.chat_id,
      counter.user_id
    )

    case counter.counter_key do
      @time_to_move_out_counter_key ->
        """
        🚜🐷 Количество призывов валить `#{counter.username}` за сегодня - `#{number_of_counters_today}`
        """
      @rechickoe_counter_key ->
        """
        🍺 Количество упоминаний речицкого от `#{counter.username}` за сегодня - `#{number_of_counters_today}`
        """
      @i_stay_counter_key ->
        """
        ✌️ Количество оставшихся `#{counter.username}` за сегодня - `#{number_of_counters_today}`
        """
      @pohui_counter_key ->
        """
        𓂸 Количество похуёв `#{counter.username}` за сегодня - `#{number_of_counters_today}`
        """
    end
  end

  def count_today_counters(counter_key, chat_id, user_id) do
    today = DateTime.utc_now() |> DateTime.to_date()
    query = from(
      c in Counter,
      select: %{
        count: count(c.id)
      },
      where: c.counter_key == ^counter_key,
      where: c.chat_id == ^chat_id,
      where: c.user_id == ^user_id,
      where: c.date == ^today
    )

    Repo.one(query).count
  end

  def get_counter!(id), do: Repo.get!(Counter, id)

  def create_counter(attrs \\ %{}) do
    attrs = Map.put(attrs, :date, NaiveDateTime.utc_now() |> NaiveDateTime.to_date())

    %Counter{}
    |> Counter.changeset(attrs)
    |> Repo.insert()
  end
end
