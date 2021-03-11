defmodule AutoWatering.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :device_id, :string
      add :plant, :string
      add :fixed_schedule, :map
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:devices, [:user_id])
  end
end
