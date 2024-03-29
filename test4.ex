record = File.read!("sales.csv")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))

month_sales = record
            |> Enum.filter(fn
                ["Date" | _ ] -> false
              _ -> true
            end)
            |> Enum.map(fn [head | tail ]-> [head, Enum.reduce(Enum.take(tail, -1), fn price, acc ->
                acc + price
             end)] end)
            |> Enum.map(fn [date, value] ->
              # This is the part that parses it into a representation that's easier to work with
              [Date.from_iso8601!(date), String.to_integer(value)]
            end)
            |> Enum.group_by(
            # This is the key function - the items will be grouped by this
            fn [date, _value] -> {date.year, date.month} end,
             # This is the value function - it will gather the results of this function under the keys
            fn [_date, value] -> value end
            )
            |> IO.inspect()

