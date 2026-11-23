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
        /* Инициализация хеш-таблицы */
        Map<Integer, String> map = new HashMap<>();

        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Сяо Я");
        System.out.println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.printHashMap(map);

        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        String name = map.get(15937);
        System.out.println("\nДля номера 15937 найдено имя " + name);

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.remove(10583);
        System.out.println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.printHashMap(map);

        /* Обход хеш-таблицы */
        System.out.println("\nОтдельный обход пар ключ-значение");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nОтдельный обход ключей");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nОтдельный обход значений");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
