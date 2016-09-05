defmodule LoopaChat.PageController do
  use LoopaChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
