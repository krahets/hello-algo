=begin
File: fractional_knapsack.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Предмет ###
class Item
  attr_accessor :w # Вес предмета
  attr_accessor :v # Стоимость предмета

  def initialize(w, v)
    @w = w
    @v = v
  end
end

### Дробный рюкзак: жадный алгоритм ###
def fractional_knapsack(wgt, val, cap)
  # Создаём список предметов с двумя свойствами: весом и стоимостью
  items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
  # Сортируем по убыванию удельной стоимости item.v / item.w
  items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
  # На каждом шаге делаем жадный выбор
  res = 0
  for item in items
    if item.w <= cap
      # Если места достаточно, кладём предмет целиком
      res += item.v
      cap -= item.w
    else
      # Если места недостаточно, кладём часть предмета
      res += (item.v.to_f / item.w) * cap
      # Рюкзак заполнен, выходим из цикла
      break
    end
  end
  res
end

### Пример запуска ###
if __FILE__ == $0
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Жадный алгоритм
  res = fractional_knapsack(wgt, val, cap)
  puts "Максимальная стоимость при заданной вместимости рюкзака: #{res}"
end
