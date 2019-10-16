records = File.read!("sales.csv")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))

[headers | rows] = records

items = rows
        |> Enum.map( fn row -> headers |> Enum.zip(row) |> Map.new end)
        |> Enum.group_by(fn %{"SKU"=> product_name } -> product_name end, fn %{"Quantity"=> quantity } -> String.to_integer(quantity) end )
        |> Enum.reduce(%{}, fn ({product_name, quantity}, acc) -> Map.put(acc, product_name, Enum.count(quantity)) end)
        |> IO.inspect


# month = rows
#         |> Enum.group_by(fn )
#         |> IO.inspect






#  [%{ date: '2019-01-01',SKU: 'some detail', unit_price: 5 ,Quantity: 10,total_price:50  }, ]
