// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* Класс списка */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* Конструктор */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // Вместимость списка
		arr:         make([]int, 10), // Массив (хранит элементы списка)
		arrSize:     0,               // Длина списка (текущее количество элементов)
		extendRatio: 2,               // Коэффициент расширения списка при каждом увеличении
	}
}

/* Получить длину списка (текущее количество элементов) */
func (l *myList) size() int {
	return l.arrSize
}

/* Получить вместимость списка */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* Получить доступ к элементу */
func (l *myList) get(index int) int {
	// Если индекс выходит за границы, выбросить исключение; далее аналогично
	if index < 0 || index >= l.arrSize {
		panic("индексвыходит за границы")
	}
	return l.arr[index]
}

/* Обновить элемент */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("индексвыходит за границы")
	}
	l.arr[index] = num
}

/* Добавить элемент в конец */
func (l *myList) add(num int) {
	// Если число элементов превышает вместимость, запустить механизм расширения
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Обновить количество элементов
	l.arrSize++
}

/* Вставить элемент в середину */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("индексвыходит за границы")
	}
	// Если число элементов превышает вместимость, запустить механизм расширения
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Обновить количество элементов
	l.arrSize++
}

/* Удалить элемент */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("индексвыходит за границы")
	}
	num := l.arr[index]
	// Сдвинуть на одну позицию вперед все элементы после индекса index
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Обновить количество элементов
	l.arrSize--
	// Вернуть удаленный элемент
	return num
}

/* Расширение списка */
func (l *myList) extendCapacity() {
	// Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// Обновить вместимость списка
	l.arrCapacity = len(l.arr)
}

/* Вернуть список действительной длины */
func (l *myList) toArray() []int {
	// Преобразовать только элементы списка в пределах действительной длины
	return l.arr[:l.arrSize]
}
