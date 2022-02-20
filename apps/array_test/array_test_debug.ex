defmodule ArrayTest do
  @moduledoc """
  Documentation for `ArrayTest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ArrayTest.hello()
      :world

  """
  def new(size) do
	:array.new(size)	
  end

  def from_list(l) when l == [], do: (IO.puts("In empty.."); :array.new)

  def from_list([h | _t] = l) when is_list(h) == false do 
		
	IO.puts("In bottom list .. #{inspect(l)}")
	ret = :array.from_list(l, :array.new)
	IO.puts("leaving bottom list .. #{inspect(ret)}")
	ret
  end

  def from_list([h | t] = l) when l != [] and is_list(l) == true do
	harr = :array.set(0, from_list(h), :array.new)
	IO.puts("harr is array? #{inspect(:array.is_array(harr))}")
	tarr = from_list(t)
	IO.puts("tarr is array? #{inspect(:array.is_array(tarr))}")
	IO.puts("tarr: #{inspect(tarr)}")
	#tarr = :array.from_list(Enum.filter(:array.to_list(tarr), fn e -> e != nil end), :array.new)  
	arr  = :array.foldl(fn i,v, acc  -> :array.set(:array.size(acc),v,acc) end, harr, tarr)   
	IO.puts("arr is array? #{inspect(:array.is_array(arr))}")
	#arr  = :array.foldl(fn i,v, acc  -> if v !=nil do :array.set(:array.size(acc),v,acc) end end, harr, tarr)   
	#arr  = :array.set(1, from_list(t), harr)
	arr
  end 

  def plist(l) when l == [], do: nil
  def plist([nl | t] = l) when is_list(nl) == false, do: [Enum.max(l)]
  def plist(l) do
	[h |t] = l
	[ plist(h),
 	  plist(t)]
  end
end
