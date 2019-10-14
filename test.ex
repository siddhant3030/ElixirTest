record = File.stream!("sales.txt")
        |> IO.inspect

        # |> Stream.map(fn date ->
        #         (date <> " 00:00:00Z")
        #         |> DateTime.from_iso8601()
        #         |> elem(1)
        #         |> DateTime.to_unix()
        #     end)
        # |> Enum.find(fn
        #         [date | _] ->
        #           ts = String.to_integer(date)
        #           dt = DateTime.from_unix!(ts)
        #           IO.puts("find -> #{date} - #{dt.year}")
        #           dt.year == 2019
        #       end)



