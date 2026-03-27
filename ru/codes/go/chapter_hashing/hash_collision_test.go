// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* Инициализировать хеш-таблицу */
	hmap := newHashMapChaining()

	/* Операция добавления */
	// Добавить в хеш-таблицу пару ключ-значение (key, value)
	hmap.put(12836, "Сяо Ха")
	hmap.put(15937, "Сяо Ло")
	hmap.put(16750, "Сяо Суань")
	hmap.put(13276, "Сяо Фа")
	hmap.put(10583, "Утенок")
	fmt.Println("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
	hmap.print()

	/* Операция поиска */
	// Передать ключ key в хеш-таблицу и получить значение value
	name := hmap.get(15937)
	fmt.Println("\nПо номеру студента 15937 найдено имя", name)

	/* Операция удаления */
	// Удалить из хеш-таблицы пару ключ-значение (key, value)
	hmap.remove(12836)
	fmt.Println("\nПосле удаления 12836 хеш-таблица выглядит так\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Инициализировать хеш-таблицу */
	hmap := newHashMapOpenAddressing()

	/* Операция добавления */
	// Добавить в хеш-таблицу пару ключ-значение (key, value)
	hmap.put(12836, "Сяо Ха")
	hmap.put(15937, "Сяо Ло")
	hmap.put(16750, "Сяо Суань")
	hmap.put(13276, "Сяо Фа")
	hmap.put(10583, "Утенок")
	fmt.Println("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
	hmap.print()

	/* Операция поиска */
	// Передать ключ key в хеш-таблицу и получить значение value
	name := hmap.get(13276)
	fmt.Println("\nПо номеру студента 13276 найдено имя ", name)

	/* Операция удаления */
	// Удалить из хеш-таблицы пару ключ-значение (key, value)
	hmap.remove(16750)
	fmt.Println("\nПосле удаления 16750 хеш-таблица выглядит так\nKey -> Value")
	hmap.print()
}
