=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # Инициализировать хеш-таблицу
  hmap = {}

  # Операция добавления
  # Добавить в хеш-таблицу пару ключ-значение (key, value)
  hmap[12836] = "Сяо Ха"
  hmap[15937] = "Сяо Ло"
  hmap[16750] = "Сяо Суань"
  hmap[13276] = "Сяо Фа"
  hmap[10583] = "Утенок"
  puts "\nПосле добавления хеш-таблица имеет вид\nKey -> Value"
  print_hash_map(hmap)

  # Операция поиска
  # Передать ключ key в хеш-таблицу и получить значение value
  name = hmap[15937]
  puts "\nВходномер 15937, найденоимя #{name}"

  # Операция удаления
  # Удалить из хеш-таблицы пару ключ-значение (key, value)
  hmap.delete(10583)
  puts "\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value"
  print_hash_map(hmap)

  # Перебрать хеш-таблицу
  puts "\nОбойтипара ключ-значение Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nотдельноОбойтиключ Key"
  hmap.keys.each { |key| puts key }

  puts "\nотдельноОбойтизначение Value"
  hmap.values.each { |val| puts val }
end
