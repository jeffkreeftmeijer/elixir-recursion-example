letters = Enum.map(?a..?z, fn x -> <<x::utf8>> end)
numbers = Enum.to_list(0..10_000)
list = Enum.shuffle(letters ++ numbers)

Benchee.run(
  %{
    "Enum.filter/2 and Enum.reduce/3" => fn -> Recursion.sum_numbers1(list) end,
    "Body-recursive" => fn -> Recursion.sum_numbers2(list) end,
    "Tail-recursive" => fn -> Recursion.sum_numbers3(list) end,
    "Smarter Enum" => fn -> Recursion.sum_numbers4(list) end
  },
  time: 10,
  memory_time: 2
)

Benchee.run(
  %{
    "Enum.filter/2 and Enum.map/2" => fn -> Recursion.double_numbers1(list) end,
    "Body-recursive" => fn -> Recursion.double_numbers2(list) end,
    "Tail-recursive" => fn -> Recursion.double_numbers3(list) end,
    "Tail-recursive (no reverse)" => fn -> Recursion.double_numbers4(list) end,
    "Tail-recursive (++)" => fn -> Recursion.double_numbers5(list) end,
    "List comprehension" => fn -> Recursion.double_numbers6(list) end
  },
  time: 10,
  memory_time: 2
)
