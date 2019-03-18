defmodule Recursion do
  def sum_numbers1(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.reduce(0, fn n, sum -> n + sum end)
  end

  def sum_numbers2([]) do
    0
  end

  def sum_numbers2([head | tail]) when is_number(head) do
    sum_numbers2(tail) + head
  end

  def sum_numbers2([_head | tail]) do
    sum_numbers2(tail)
  end

  def sum_numbers3(list) do
    do_sum_numbers3(list, 0)
  end

  defp do_sum_numbers3([], sum) do
    sum
  end

  defp do_sum_numbers3([head | tail], sum) when is_number(head) do
    do_sum_numbers3(tail, sum + head)
  end

  defp do_sum_numbers3([_head | tail], sum) do
    do_sum_numbers3(tail, sum)
  end

  def sum_numbers4(list) do
    Enum.filter(list, &value/1)
  end

  defp value(val) when is_number(val), do: val
  defp value(_), do: 0

  def double_numbers1(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.map(fn n -> n * 2 end)
  end

  def double_numbers2([]) do
    []
  end

  def double_numbers2([head | tail]) when is_number(head) do
    [head * 2 | double_numbers2(tail)]
  end

  def double_numbers2([_head | tail]) do
    double_numbers2(tail)
  end

  def double_numbers3(list) do
    list
    |> do_double_numbers3([])
    |> Enum.reverse()
  end

  defp do_double_numbers3([], acc) do
    acc
  end

  defp do_double_numbers3([head | tail], acc) when is_number(head) do
    do_double_numbers3(tail, [head * 2 | acc])
  end

  defp do_double_numbers3([_head | tail], acc) do
    do_double_numbers3(tail, acc)
  end

  def double_numbers4(list) do
    do_double_numbers3(list, [])
  end

  def double_numbers5(list) do
    do_double_numbers5(list, [])
  end

  defp do_double_numbers5([], acc) do
    acc
  end

  defp do_double_numbers5([head | tail], acc) when is_number(head) do
    do_double_numbers5(tail, acc ++ [head * 2])
  end

  defp do_double_numbers5([_head | tail], acc) do
    do_double_numbers5(tail, acc)
  end

  def double_numbers6(list) do
    for n when is_number(n) <- list, do: n * 2
  end
end
