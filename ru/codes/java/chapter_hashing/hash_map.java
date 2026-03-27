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
        /* Инициализировать хеш-таблицу */
        Map<Integer, String> map = new HashMap<>();

        /* Операция добавления */
        // Добавить в хеш-таблицу пару ключ-значение (key, value)
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Утенок");
        System.out.println("\nПосле добавления хеш-таблица выглядит так\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Операция поиска */
        // Передать ключ key в хеш-таблицу и получить значение value
        String name = map.get(15937);
        System.out.println("\nПо номеру студента 15937 найдено имя " + name);

        /* Операция удаления */
        // Удалить из хеш-таблицы пару ключ-значение (key, value)
        map.remove(10583);
        System.out.println("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Перебрать хеш-таблицу */
        System.out.println("\nПеребираем пары Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nОтдельно перебираем ключи Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nОтдельно перебираем значения Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
