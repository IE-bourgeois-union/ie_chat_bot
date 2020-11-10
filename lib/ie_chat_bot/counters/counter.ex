defmodule IeChatBot.Counters.Counter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "counters" do
    field :chat_id, :integer
    field :counter_key, :string
    field :user_id, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(counter, attrs) do
    counter
    |> cast(attrs, [:counter_key, :user_id, :username, :chat_id])
    |> validate_required([:counter_key, :user_id, :username, :chat_id])
  end
end
