=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Демонстрационный код ###
if __FILE__ == $0
  # Создать хеш-таблицу
  hmap = {}

  # Вставка
  # Добавить в таблицу пару (key, value)
  hmap[12836] = "Сяо Ха"
  hmap[15937] = "Сяо Ло"
  hmap[16750] = "Сяо Суань"
  hmap[13276] = "Сяо Фа"
  hmap[10583] = "Сяо Я"
  puts "\nХеш-таблица после вставки:\nКлюч -> Значение"
  print_hash_map(hmap)

  # Поиск
  # Получить из таблицы значение value по ключу key
  name = hmap[15937]
  puts "\nИмя студента с номером 15937: #{name}"

  # Удаление
  # Удалить из таблицы пару (key, value)
  hmap.delete(10583)
  puts "\nХеш-таблица после удаления 10583:\nКлюч -> Значение"
  print_hash_map(hmap)

  # Обход хеш-таблицы
  puts "\nОбход пар «ключ -> значение»"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nОбход только ключей"
  hmap.keys.each { |key| puts key }

  puts "\nОбход только значений"
  hmap.values.each { |val| puts val }
end
