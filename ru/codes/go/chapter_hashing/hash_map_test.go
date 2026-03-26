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
	fmt.Println("\nПосле добавления хеш-таблица имеет вид\nKey -> Value")
	PrintMap(hmap)

	/* Операция поиска */
	// Передать ключ key в хеш-таблицу и получить значение value
	name := hmap[15937]
	fmt.Println("\nВходномер 15937, найденоимя", name)

	/* Операция удаления */
	// Удалить из хеш-таблицы пару ключ-значение (key, value)
	delete(hmap, 10583)
	fmt.Println("\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value")
	PrintMap(hmap)

	/* Перебрать хеш-таблицу */
	// Обойтипара ключ-значение key->value
	fmt.Println("\nОбойтипара ключ-значение Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// отдельноОбойтиключ key
	fmt.Println("\nотдельноОбойтиключ Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// отдельноОбойтизначение value
	fmt.Println("\nотдельноОбойтизначение Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello Algo"

	hash = addHash(key)
	fmt.Println("Значение аддитивного хеширования равно" + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Значение мультипликативного хеширования равно" + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("Значение XOR-хеширования равно" + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Значение вращательного хеширования равно" + strconv.Itoa(hash))
}
