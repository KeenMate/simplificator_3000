defmodule Simplificator3000.PhoenixWeb.Request do
  import Plug.Conn

  def request_ip(conn) do
    conn.remote_ip
    |> :inet_parse.ntoa()
    |> to_string()
  end

  def user_agent(conn) do
    case get_req_header(conn, "user-agent") do
      [user_agent] -> user_agent
      _ -> nil
    end
  end

  def request_id() do
    Logger.metadata()[:request_id]
  end
end
