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
        /* Создать хеш-таблицу */
        Map<Integer, String> map = new HashMap<>();

        /* Вставка */
        // Добавить в таблицу пару (key, value)
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Сяо Я");
        System.out.println("\nХеш-таблица после вставки:\nКлюч -> Значение");
        PrintUtil.printHashMap(map);

        /* Поиск */
        // Получить из таблицы значение value по ключу key
        String name = map.get(15937);
        System.out.println("\nИмя студента с номером 15937: " + name);

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.remove(10583);
        System.out.println("\nХеш-таблица после удаления 10583:\nКлюч -> Значение");
        PrintUtil.printHashMap(map);

        /* Обход хеш-таблицы */
        System.out.println("\nОбход пар «ключ -> значение»");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nОбход только ключей");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nОбход только значений");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
