/**
 * File: hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;
import utils.*;

public class hash_map {
    public static void main(String[] args) {
        // [region]{init_hash_map}
        /* Инициализация хеш-таблицы */
        Map<Integer, String> map = new HashMap<>();
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Сяо Я");
        // [endregion]{add_pairs}
        System.out.println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.printHashMap(map);

        // [region]{get_value}
        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        String name = map.get(15937);
        // [endregion]{get_value}
        System.out.println("\nДля номера 15937 найдено имя " + name);

        // [region]{remove_pair}
        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.remove(10583);
        // [endregion]{remove_pair}
        System.out.println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.printHashMap(map);

        System.out.println("\nОтдельный обход пар ключ-значение");
        // [region]{iterate_pairs}
        /* Обход хеш-таблицы */
        // Обход пар ключ-значение key->value
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        // [endregion]{iterate_pairs}

        System.out.println("\nОтдельный обход ключей");
        // [region]{iterate_keys}
        // Обход только ключей key
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        // [endregion]{iterate_keys}

        System.out.println("\nОтдельный обход значений");
        // [region]{iterate_values}
        // Обход только значений value
        for (String val : map.values()) {
            System.out.println(val);
        }
        // [endregion]{iterate_values}
    }
}
