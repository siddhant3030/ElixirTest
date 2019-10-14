# records = File.read!('sales.txt')
#             |> String.split("\n")
#             |> Enum.map(&String.split(&1,","))
#             |> Enum.filter(fn
#               ["Total Price" | _ ] -> false
#               _ -> true
#             end)
#             |> IO.inspect()


record = File.read!("sales.txt")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))

month_sale = record
             |> Enum.filter(fn
             ["Date" | _] -> false
                 _ -> true
             end)



# total_price = record
#               |> Enum.filter(fn
#                 ["Date" | _ ] -> false
#               _ -> true
#             end)
#               |> Enum.map(fn row -> Enum.take(row, -1) end)
#               |> Enum.map( fn [row_value] -> String.to_integer(row_value) end)
#               |> Enum.reduce(fn val, acc -> val + acc end)
#               |> IO.inspect()

#[1,2,3] |> Enum.take(-1)|> IO.inspect()



