record = File.read!("sales.txt")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))






total_price_by_month = record
              |> Enum.filter(fn
                ["Date" | _ ] -> false
              _ -> true
              end)
              |> Enum.map(fn [head | row] ->
                d =  (head <> " 00:00:00Z")
                                  |> DateTime.from_iso8601()
                                  |> elem(1)
              [ "#{d.year} - #{d.month}", List.first(Enum.take(row, -1))]
              end)
              # |> Enum.map(fn d -> "#{d.year} - #{d.month}" end)
              # |> Enum.find(fn
              #   [timestamp | _] ->
              #     ts = String.to_integer(timestamp)
              #     dt = DateTime.from_unix!(ts)
              #     IO.puts("find -> #{timestamp} - #{dt.month}")
              #     dt.month == 1
              # end)
              |> Enum.filter(fn [head | _] -> head == "2019 - 1" end)
              # |> Enum.reduce(fn item, acc -> String.to_integer(List.last(acc)) + String.to_integer(List.last(item)) end)
              # |> Enum.filter(fn d ->
              #   month_of_year(d)
              # end)
              |> IO.inspect()




# def convert_string_to_date(date_string) do
#    (date_string <> " 00:00:00Z")
#     |> DateTime.from_iso8601()
#     |> elem(1)
# end

# month_sales = record
#             |> Enum.filter(fn
#                 ["Date" | _ ] -> false
#               _ -> true
#             end)
#             |> Enum.map(fn [head | tail ]-> [head, Enum.reduce(Enum.take(tail, -1), fn price, acc ->
#                 acc + price
#              end)] end)
#             |> Enum.map(fn r -> Enum.take(r, 1) end)
#             |> Enum.find(fn
#               [date | _] ->
#                 dt =
#                   date
#                   |> String.to_integer()
#                   |> DateTime.from_unix!()

#                   dt.month == 1
#               end
#             )
#             |> IO.inspect()
