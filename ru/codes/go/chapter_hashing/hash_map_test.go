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
	/* Инициализация хеш-таблицы */
	hmap := make(map[int]string)

	/* Операция добавления */
	// Добавить пару (key, value) в хеш-таблицу
	hmap[12836] = "Сяо Ха"
	hmap[15937] = "Сяо Ло"
	hmap[16750] = "Сяо Суань"
	hmap[13276] = "Сяо Фа"
	hmap[10583] = "Сяо Я"
	fmt.Println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
	PrintMap(hmap)

	/* Операция поиска */
	// Ввести в хеш-таблицу ключ key и получить значение value
	name := hmap[15937]
	fmt.Println("\nДля номера 15937 найдено имя", name)

	/* Операция удаления */
	// Удалить пару (key, value) из хеш-таблицы
	delete(hmap, 10583)
	fmt.Println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
	PrintMap(hmap)

	/* Обход хеш-таблицы */
	// Перебрать пары ключ-значение key->value
	fmt.Println("\nОтдельный обход пар ключ-значение")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Отдельно обходить ключи key
	fmt.Println("\nОтдельный обход ключей")
	for key := range hmap {
		fmt.Println(key)
	}
	// Отдельно обходить значения value
	fmt.Println("\nОтдельный обход значений")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello Algo"

	hash = addHash(key)
	fmt.Println("Хеш-сумма сложением = " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Хеш-сумма умножением = " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("Хеш-сумма XOR = " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Хеш-сумма с циклическим сдвигом = " + strconv.Itoa(hash))
}
