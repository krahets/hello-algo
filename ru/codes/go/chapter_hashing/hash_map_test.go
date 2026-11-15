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
	// [region]{init_hash_map}
	/* Инициализация хеш-таблицы */
	hmap := make(map[int]string)
	// [endregion]{init_hash_map}

	// [region]{add_pairs}
	/* Операция добавления */
	// Добавить пару (key, value) в хеш-таблицу
	hmap[12836] = "Сяо Ха"
	hmap[15937] = "Сяо Ло"
	hmap[16750] = "Сяо Суань"
	hmap[13276] = "Сяо Фа"
	hmap[10583] = "Сяо Я"
	// [endregion]{add_pairs}
	fmt.Println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
	PrintMap(hmap)

	// [region]{get_value}
	/* Операция поиска */
	// Ввести в хеш-таблицу ключ key и получить значение value
	name := hmap[15937]
	// [endregion]{get_value}
	fmt.Println("\nДля номера 15937 найдено имя", name)

	// [region]{remove_pair}
	/* Операция удаления */
	// Удалить пару (key, value) из хеш-таблицы
	delete(hmap, 10583)
	// [endregion]{remove_pair}
	fmt.Println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
	PrintMap(hmap)

	fmt.Println("\nОтдельный обход пар ключ-значение")
	// [region]{iterate_pairs}
	/* Обход хеш-таблицы */
	// Обход пар ключ-значение key->value
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// [endregion]{iterate_pairs}

	fmt.Println("\nОтдельный обход ключей")
	// [region]{iterate_keys}
	// Обход только ключей key
	for key := range hmap {
		fmt.Println(key)
	}
	// [endregion]{iterate_keys}

	fmt.Println("\nОтдельный обход значений")
	// [region]{iterate_values}
	// Обход только значений value
	for _, value := range hmap {
		fmt.Println(value)
	}
	// [endregion]{iterate_values}
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
