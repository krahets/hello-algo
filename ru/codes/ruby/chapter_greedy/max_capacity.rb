=begin
File: max_capacity.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Максимальная вместимость: жадный алгоритм ###
def max_capacity(ht)
  # Ставим i и j на противоположные концы массива
  i, j = 0, ht.length - 1
  # Изначально максимальная вместимость равна 0
  res = 0

  # Повторяем жадный выбор, пока перегородки не встретятся
  while i < j
    # Обновляем максимальную вместимость
    cap = [ht[i], ht[j]].min * (j - i)
    res = [res, cap].max
    # Сдвигаем указатель у более низкой перегородки к центру
    if ht[i] < ht[j]
      i += 1
    else
      j -= 1
    end
  end

  res
end

### Пример запуска ###
if __FILE__ == $0
  ht = [3, 8, 5, 2, 7, 7, 3, 4]

  # Жадный алгоритм
  res = max_capacity(ht)
  puts "Максимальная вместимость: #{res}"
end
