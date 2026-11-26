// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* Создать хеш-таблицу */
	hmap := newArrayHashMap()

	/* Вставка */
	// Добавить в таблицу пару (key, value)
	hmap.put(12836, "Сяо Ха")
	hmap.put(15937, "Сяо Ло")
	hmap.put(16750, "Сяо Суань")
	hmap.put(13276, "Сяо Фа")
	hmap.put(10583, "Сяо Я")
	fmt.Println("\nХеш-таблица после вставки:\nКлюч -> Значение")
	hmap.print()

	/* Поиск */
	// Получить из таблицы значение value по ключу key
	name := hmap.get(15937)
	fmt.Println("\nИмя студента с номером 15937: " + name)

	/* Удаление */
	// Удалить из таблицы пару (key, value)
	hmap.remove(10583)
	fmt.Println("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
	hmap.print()

	/* Обход хеш-таблицы */
	fmt.Println("\nОбход пар «ключ -> значение»")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nОбход только ключей")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nОбход только значений")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
