records = File.read!("sales.csv")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))

[headers | rows] = records

items = rows
        |> Enum.map( fn row -> headers |> Enum.zip(row) |> Map.new end)
        |> Enum.group_by(fn %{"SKU"=> product} -> product end, fn %{"Quantity"=> quantity, "Date"=> date } -> %{ date: date, quantity: String.to_integer(quantity) } end )
        |> Enum.map(fn {product, quantity} ->
          {
            product,
            Enum.group_by(quantity, &(String.slice(&1.date, 0, 7)), &(&1.quantity))
            |> Enum.map(fn {k, v} -> %{date: k, quantity: Enum.sum(v)} end)}
        end) |> Map.new()
        |> IO.inspect




#  [%{ date: '2019-01-01',SKU: 'some detail', unit_price: 5 ,Quantity: 10,total_price:50  }, ]
