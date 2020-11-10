defmodule IeChatBot.Repo.Migrations.AddDateToCounters do
  use Ecto.Migration

  def change do
    alter table(:counters) do
      add :date, :date, null: true
    end
  end
end
