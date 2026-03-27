=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Предмет ###
class Item
  attr_accessor :w # Вес предмета
  attr_accessor :v # Стоимость предмета

  def initialize(w, v)
    @w = w
    @v = v
  end
end

# ## Дробный рюкзак: жадный алгоритм ###
def fractional_knapsack(wgt, val, cap)
  # Создать список предметов с двумя свойствами: вес и стоимость
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # Отсортировать по удельной стоимости item.v / item.w в порядке убывания
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # Циклический жадный выбор
  res = 0
  for item in items
    if item.w <= cap
      # Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
      res += item.v
      cap -= item.w
    else
      # Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
      res += (item.v.to_f / item.w) * cap
      # Свободной вместимости больше не осталось, поэтому выйти из цикла
      break
    end
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Жадный алгоритм
  res = fractional_knapsack(wgt, val, cap)
  puts "Максимальная стоимость предметов без превышения вместимости рюкзака = #{res}"
end
