// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestMyList(t *testing.T) {
	/* Инициализировать список */
	nums := newMyList()
	/* Добавить элемент в конец */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("список nums = %v, вместимость = %v, длина = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* Вставить элемент в середину */
	nums.insert(6, 3)
	fmt.Printf("После вставки числа 6 по индексу 3 получаем nums = %v\n", nums.toArray())

	/* Удалить элемент */
	nums.remove(3)
	fmt.Printf("После удаления элемента по индексу 3 получаем nums = %v\n", nums.toArray())

	/* Получить доступ к элементу */
	num := nums.get(1)
	fmt.Printf("обратиться киндекс 1 поэлемент, получаем num = %v\n", num)

	/* Обновить элемент */
	nums.set(0, 1)
	fmt.Printf("После обновления элемента по индексу 1 на 0 получаем nums = %v\n", nums.toArray())

	/* Проверить механизм расширения */
	for i := 0; i < 10; i++ {
		// При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
		nums.add(i)
	}
	fmt.Printf("Список nums после расширения = %v, вместимость = %v, длина = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
