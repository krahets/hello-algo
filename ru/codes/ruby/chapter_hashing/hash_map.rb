=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # [region]{init_hash_map}
  # Инициализация хеш-таблицы
  hmap = {}
  # [endregion]{init_hash_map}

  # [region]{add_pairs}
  # Операция добавления
  # Добавить пару (key, value) в хеш-таблицу
  hmap[12836] = "Сяо Ха"
  hmap[15937] = "Сяо Ло"
  hmap[16750] = "Сяо Суань"
  hmap[13276] = "Сяо Фа"
  hmap[10583] = "Сяо Я"
  # [endregion]{add_pairs}
  puts "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение"
  print_hash_map(hmap)

  # [region]{get_value}
  # Операция поиска
  # Передать ключ key в хеш-таблицу и получить значение value
  name = hmap[15937]
  # [endregion]{get_value}
  puts "\nДля номера 15937 найдено имя #{name}"

  # [region]{remove_pair}
  # Операция удаления
  # Удалить пару (key, value) из хеш-таблицы
  hmap.delete(10583)
  # [endregion]{remove_pair}
  puts "\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение"
  print_hash_map(hmap)

  puts "\nОтдельный обход пар ключ-значение"
  # [region]{iterate_pairs}
  # Обход хеш-таблицы
  # Обход пар ключ-значение key->value
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
  # [endregion]{iterate_pairs}

  puts "\nОтдельный обход ключей"
  # [region]{iterate_keys}
  # Обход только ключей key
  hmap.keys.each { |key| puts key }
  # [endregion]{iterate_keys}

  puts "\nОтдельный обход значений"
  # [region]{iterate_values}
  # Обход только значений value
  hmap.values.each { |val| puts val }
  # [endregion]{iterate_values}
end
