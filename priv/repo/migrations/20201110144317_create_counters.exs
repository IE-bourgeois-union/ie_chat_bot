defmodule IeChatBot.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do
      add :counter_key, :string, null: false
      add :user_id, :bigint, null: false
      add :username, :string, null: false
      add :chat_id, :bigint, null: false

      timestamps()
    end

  end
end
