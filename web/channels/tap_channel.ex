defmodule Htap.TapChannel do
  use Phoenix.Channel

  def join("taps:first", _message, socket) do
    {:ok, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
