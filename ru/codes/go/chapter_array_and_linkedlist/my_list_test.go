// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Демонстрационный код */
func TestMyList(t *testing.T) {
	/* Инициализация списка */
	nums := newMyList()
	/* Добавление элемента в конец */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("Список nums = %v, ёмкость = %v, длина = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* Вставка элемента в середину */
	nums.insert(6, 3)
	fmt.Printf("После вставки числа 6 по индексу 3 nums = %v\n", nums.toArray())

	/* Удаление элемента */
	nums.remove(3)
	fmt.Printf("После удаления элемента по индексу 3 nums = %v\n", nums.toArray())

	/* Доступ к элементу */
	num := nums.get(1)
	fmt.Printf("Элемент по индексу 1: num = %v\n", num)

	/* Изменение элемента */
	nums.set(0, 1)
	fmt.Printf("После записи 0 по индексу 1 nums = %v\n", nums.toArray())

	/* Проверка увеличения ёмкости */
	for i := 0; i < 10; i++ {
		// При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
		nums.add(i)
	}
	fmt.Printf("После увеличения ёмкости список nums = %v, ёмкость = %v, длина = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
