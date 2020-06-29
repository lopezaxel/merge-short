def merge_sort(array)
  return unless array.size > 1

  b = array[0, array.size / 2]
  c = array[array.size / 2, array.size]

  merge_sort(b)
  merge_sort(c)

  merge(array, b, c)
end

def merge(a, b, c)
  a_idx, b_idx, c_idx = 0, 0, 0

  while b_idx < b.size && c_idx < c.size
    if b[b_idx] < c[c_idx]
      a[a_idx] = b[b_idx]
      b_idx += 1
    else
      a[a_idx] = c[c_idx]
      c_idx += 1
    end
    a_idx += 1
  end

  a[a_idx, a.size] = if b_idx == b.size
                       c[c_idx, c.size]
                     else
                       b[b_idx, b.size]
                     end

  a
end

array = (1..8).to_a.shuffle
p array
p merge_sort(array)
