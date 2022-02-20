defmodule ArrayTest do
  @moduledoc """
  Documentation for `ArrayTest`.
  """

  @doc """

  """
  def new(size) do
	:array.new(size)	
  end

  def from_list(l) when l == [], do: :array.new

  def from_list([h | _t] = l) when is_list(h) == false do 
		
	:array.from_list(l, :array.new)
  end

  def from_list([h | t] = l) when l != [] and is_list(l) == true do
	harr = :array.set(0, from_list(h), :array.new)
	tarr = from_list(t)
	:array.foldl(fn i,v, acc  -> :array.set(:array.size(acc),v,acc) end, harr, tarr)   
  end 

  def plist(l) when l == [], do: nil
  def plist([nl | t] = l) when is_list(nl) == false, do: [Enum.max(l)]
  def plist(l) do
	[h |t] = l
	[ plist(h),
 	  plist(t)]
  end

  def mat_mult(x, y) do
	:array.map(fn _i, vi ->
        :array.map(fn j, _vj ->
                :array.foldl(fn k, _vk, _acc ->
                :array.get(k, vi) * :array.get(j, :array.get(k, y))
                                end, 0, vi)
                        end, vi)
        end, x)
  end

  def trpose(x) do
     :array.map(fn i, vi ->
        :array.map(fn j, _vj ->
                :array.get(i, :array.get(j, x))
                        end, vi)
        end, x)
  end

end
