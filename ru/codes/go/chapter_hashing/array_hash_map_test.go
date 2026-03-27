// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* Инициализация хеш-таблицы */
	hmap := newArrayHashMap()

	/* Операция добавления */
	// Добавить пару (key, value) в хеш-таблицу
	hmap.put(12836, "Сяо Ха")
	hmap.put(15937, "Сяо Ло")
	hmap.put(16750, "Сяо Суань")
	hmap.put(13276, "Сяо Фа")
	hmap.put(10583, "Сяо Я")
	fmt.Println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
	hmap.print()

	/* Операция поиска */
	// Ввести в хеш-таблицу ключ key и получить значение value
	name := hmap.get(15937)
	fmt.Println("\nДля номера 15937 найдено имя " + name)

	/* Операция удаления */
	// Удалить пару (key, value) из хеш-таблицы
	hmap.remove(10583)
	fmt.Println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
	hmap.print()

	/* Обход хеш-таблицы */
	fmt.Println("\nОтдельный обход пар ключ-значение")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nОтдельный обход ключей")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nОтдельный обход значений")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
