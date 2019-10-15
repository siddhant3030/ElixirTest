records = File.read!("sales.csv")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))

[headers | rows] = records
# require IEx; IEx.pry
month_sales = rows
            |> Enum.map( fn row -> headers |> Enum.zip(row) |> Map.new end)
            |> Enum.group_by(fn %{"SKU"=> product_name } -> product_name end, fn %{"Quantity"=> quantity } -> String.to_integer(quantity) end )
            # |> Enum.map(fn %{product_name, quantities} -> Enum.max(quantites) end)
            |> IO.inspect


#  [%{ date: '2019-01-01',SKU: 'some detail', unit_price: 5 ,Quantity: 10,total_price:50  }, ]
