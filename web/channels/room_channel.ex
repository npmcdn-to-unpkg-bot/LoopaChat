defmodule LoopaChat.RoomChannel do
  use LoopaChat.Web, :channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  
  #def join("room:" <> _private_room_id, _params, socket) do
  #  {:error, %{reason: "unauthorized"}}
  #end
  
  def handle_in("new_msg", %{"body" => body, "name" => name}, socket) do
    broadcast! socket, "new_msg", %{body: body, name: name}
    {:noreply, socket}
  end
  
  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
