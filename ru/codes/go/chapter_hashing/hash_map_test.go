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
	/* Инициализировать хеш-таблицу */
	hmap := make(map[int]string)

	/* Операция добавления */
	// Добавить в хеш-таблицу пару ключ-значение (key, value)
	hmap[12836] = "Сяо Ха"
	hmap[15937] = "Сяо Ло"
	hmap[16750] = "Сяо Суань"
	hmap[13276] = "Сяо Фа"
	hmap[10583] = "Утенок"
	fmt.Println("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
	PrintMap(hmap)

	/* Операция поиска */
	// Передать ключ key в хеш-таблицу и получить значение value
	name := hmap[15937]
	fmt.Println("\nПо номеру студента 15937 найдено имя ", name)

	/* Операция удаления */
	// Удалить из хеш-таблицы пару ключ-значение (key, value)
	delete(hmap, 10583)
	fmt.Println("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value")
	PrintMap(hmap)

	/* Перебрать хеш-таблицу */
	// Обойтипара ключ-значение key->value
	fmt.Println("\nПеребираем пары Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// отдельноОбойтиключ key
	fmt.Println("\nОтдельно перебираем ключи Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// отдельноОбойтизначение value
	fmt.Println("\nОтдельно перебираем значения Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello Algo"

	hash = addHash(key)
	fmt.Println("Аддитивное хешированиезначениеравно" + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Мультипликативное хешированиезначениеравно" + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR-хешированиезначениеравно" + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Вращательное хешированиезначениеравно" + strconv.Itoa(hash))
}
