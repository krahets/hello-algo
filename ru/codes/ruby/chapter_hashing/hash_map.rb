=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # Инициализация хеш-таблицы
  hmap = {}

  # Операция добавления
  # Добавить пару (key, value) в хеш-таблицу
  hmap[12836] = "Сяо Ха"
  hmap[15937] = "Сяо Ло"
  hmap[16750] = "Сяо Суань"
  hmap[13276] = "Сяо Фа"
  hmap[10583] = "Сяо Я"
  puts "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение"
  print_hash_map(hmap)

  # Операция поиска
  # Передать ключ key в хеш-таблицу и получить значение value
  name = hmap[15937]
  puts "\nДля номера 15937 найдено имя #{name}"

  # Операция удаления
  # Удалить пару (key, value) из хеш-таблицы
  hmap.delete(10583)
  puts "\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение"
  print_hash_map(hmap)

  # Обход хеш-таблицы
  puts "\nОтдельный обход пар ключ-значение"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nОтдельный обход ключей"
  hmap.keys.each { |key| puts key }

  puts "\nОтдельный обход значений"
  hmap.values.each { |val| puts val }
end
