// File: hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHashMap(t *testing.T) {
	/* Создать хеш-таблицу */
	hmap := make(map[int]string)

	/* Вставка */
	// Добавить в таблицу пару (key, value)
	hmap[12836] = "Сяо Ха"
	hmap[15937] = "Сяо Ло"
	hmap[16750] = "Сяо Суань"
	hmap[13276] = "Сяо Фа"
	hmap[10583] = "Сяо Я"
	fmt.Println("\nХеш-таблица после вставки:\nКлюч -> Значение")
	PrintMap(hmap)

	/* Поиск */
	// Получить из таблицы значение value по ключу key
	name := hmap[15937]
	fmt.Println("\nИмя студента с номером 15937: ", name)

	/* Удаление */
	// Удалить из таблицы пару (key, value)
	delete(hmap, 10583)
	fmt.Println("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
	PrintMap(hmap)

	/* Обход хеш-таблицы */
	// Обход пар «ключ -> значение»
	fmt.Println("\nОбход пар «ключ -> значение»")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Обход только ключей
	fmt.Println("\nОбход только ключей")
	for key := range hmap {
		fmt.Println(key)
	}
	// Обход только значений
	fmt.Println("\nОбход только значений")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 算法"

	hash = addHash(key)
	fmt.Println("Аддитивный хеш: " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Мультипликативный хеш: " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("Хеш на основе XOR: " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Хеш с циклическим сдвигом: " + strconv.Itoa(hash))
}
