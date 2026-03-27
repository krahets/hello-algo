=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Максимальная вместимость: жадный алгоритм ###
def max_capacity(ht)
  # Инициализировать i и j так, чтобы они располагались по двум концам массива
  i, j = 0, ht.length - 1
  # Начальная максимальная вместимость равна 0
  res = 0

  # Выполнять жадный выбор в цикле, пока две доски не встретятся
  while i < j
    # Обновить максимальную вместимость
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # Сдвигать внутрь более короткую сторону
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### Driver Code ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # Жадный алгоритм
  res = max_capacity(ht)
  puts "Максимальная вместимость = #{res}"
end
