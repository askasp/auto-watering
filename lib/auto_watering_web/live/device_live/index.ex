defmodule AutoWateringWeb.DeviceLive.Index do
  use AutoWateringWeb, :live_view

  alias AutoWatering.Devices
  alias AutoWatering.Devices.Device

  alias AutoWatering.Accounts


  def mount(_params, %{"user_token" => user_token} = _session, socket) do
        new_sock = assign_new(socket, :current_user, fn -> Accounts.get_user_by_session_token(user_token) end)
         {:ok, assign(new_sock, :devices, list_devices(new_sock.assigns.current_user))}
  end


  @impl true
  def mount(_params, session, socket) do
      IO.inspect session
    {:ok, assign(socket, :devices, list_devices(socket.assings.current_user))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Device")
    |> assign(:device, Devices.get_device!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Device")
    |> assign(:device, %Device{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Devices")
    |> assign(:device, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    device = Devices.get_device!(id)
    {:ok, _} = Devices.delete_device(device)

    {:noreply, assign(socket, :devices, list_devices(socket.assigns.current_user))}
  end

  defp list_devices(user) do
    Devices.list_devices(user)
  end
end
