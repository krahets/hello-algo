// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* Создать хеш-таблицу */
	hmap := newHashMapChaining()

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
	fmt.Println("\nИмя студента с номером 15937:", name)

	/* Удаление */
	// Удалить из таблицы пару (key, value)
	hmap.remove(12836)
	fmt.Println("\nХеш-таблица после удаления 12836:\nКлюч -> Значение")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Создать хеш-таблицу */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\nИмя студента с номером 13276: ", name)

	/* Удаление */
	// Удалить из таблицы пару (key, value)
	hmap.remove(16750)
	fmt.Println("\nХеш-таблица после удаления 16750:\nКлюч -> Значение")
	hmap.print()
}
