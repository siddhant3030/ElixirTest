record = File.read!("sales.txt")
|> String.split("\n")
|> Enum.map(&String.split(&1, ","))


# date =
#        |> Ecto.DateTime.to_erl
#        |> :calendar.datetime_to_gregorian_seconds
#        |> Kernel.-(62167219200)
