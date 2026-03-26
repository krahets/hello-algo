// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* Инициализировать хеш-таблицу */
	hmap := newArrayHashMap()

	/* Операция добавления */
	// Добавить в хеш-таблицу пару ключ-значение (key, value)
	hmap.put(12836, "Сяо Ха")
	hmap.put(15937, "Сяо Ло")
	hmap.put(16750, "Сяо Суань")
	hmap.put(13276, "Сяо Фа")
	hmap.put(10583, "Утенок")
	fmt.Println("\nПосле добавления хеш-таблица имеет вид\nKey -> Value")
	hmap.print()

	/* Операция поиска */
	// Передать ключ key в хеш-таблицу и получить значение value
	name := hmap.get(15937)
	fmt.Println("\nВходномер 15937, найденоимя" + name)

	/* Операция удаления */
	// Удалить из хеш-таблицы пару ключ-значение (key, value)
	hmap.remove(10583)
	fmt.Println("\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value")
	hmap.print()

	/* Перебрать хеш-таблицу */
	fmt.Println("\nОбойтипара ключ-значение Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nотдельноОбойтиключ Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nотдельноОбойтизначение Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
