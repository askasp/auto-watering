defmodule AutoWatering.DevicesTest do
  use AutoWatering.DataCase

  alias AutoWatering.Devices

  describe "devices" do
    alias AutoWatering.Devices.Device

    @valid_attrs %{device_id: "some device_id", fixed_schedule: %{}, plant: "some plant"}
    @update_attrs %{device_id: "some updated device_id", fixed_schedule: %{}, plant: "some updated plant"}
    @invalid_attrs %{device_id: nil, fixed_schedule: nil, plant: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Devices.create_device()

      device
    end

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert Devices.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert Devices.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      assert {:ok, %Device{} = device} = Devices.create_device(@valid_attrs)
      assert device.device_id == "some device_id"
      assert device.fixed_schedule == %{}
      assert device.plant == "some plant"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Devices.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      assert {:ok, %Device{} = device} = Devices.update_device(device, @update_attrs)
      assert device.device_id == "some updated device_id"
      assert device.fixed_schedule == %{}
      assert device.plant == "some updated plant"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Devices.update_device(device, @invalid_attrs)
      assert device == Devices.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = Devices.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Devices.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = Devices.change_device(device)
    end
  end
end
