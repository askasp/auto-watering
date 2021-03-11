defmodule AutoWatering.Devices.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :device_id, :string
    field :fixed_schedule, :map
    field :plant, :string
    belongs_to :user, AutoWatering.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:device_id, :plant, :fixed_schedule])
    |> validate_required([:device_id])
  end
end
