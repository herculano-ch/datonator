defmodule DatonatorWeb.Report.EligibleController do
  use DatonatorWeb, :controller

  alias Datonator.User
  alias NimbleCSV.RFC4180, as: CSV

  def index(conn, _params) do
    conn =
      conn
      |> put_resp_content_type("text/csv")
      |> put_resp_header("content-disposition", ~s[attachment; filename="report.csv"])
      |> send_chunked(:ok)

    evalute_connection(conn)
  end

  defp evalute_connection(conn) do
    User.get_eligibles_with_stream fn stream ->
      for result <- stream do
        csv_rows =
          result
          |> format_data()
          |> CSV.dump_to_iodata()

        chunk(conn, csv_rows)
      end
    end

    conn
  end

  defp format_data(result) do
    [["#{result.name},#{result.email},#{result.employee_number},#{result.department}"]]
  end
end
