records = File.read!("sales.csv")
              |> String.split("\n")
              |> Enum.map(&String.split(&1,","))
[headers | rows] = records
items = rows
        |> Enum.map( fn row -> headers |> Enum.zip(row) |> Map.new end)

        |> IO.inspect()
