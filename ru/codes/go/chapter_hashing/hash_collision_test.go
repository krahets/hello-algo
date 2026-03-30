// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* Инициализация хеш-таблицы */
	hmap := newHashMapChaining()

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
	fmt.Println("\nДля номера 15937 найдено имя", name)

	/* Операция удаления */
	// Удалить пару (key, value) из хеш-таблицы
	hmap.remove(12836)
	fmt.Println("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Инициализация хеш-таблицы */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\nДля номера 13276 найдено имя", name)

	/* Операция удаления */
	// Удалить пару (key, value) из хеш-таблицы
	hmap.remove(16750)
	fmt.Println("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение")
	hmap.print()
}
