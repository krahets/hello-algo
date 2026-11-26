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
		arrCapacity: 10,              // Ёмкость списка
		arr:         make([]int, 10), // Массив для хранения элементов списка
		arrSize:     0,               // Длина списка (текущее количество элементов)
		extendRatio: 2,               // Коэффициент увеличения ёмкости списка
	}
}

/* Получить длину списка (текущее количество элементов) */
func (l *myList) size() int {
	return l.arrSize
}

/*  Получить ёмкость списка */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* Доступ к элементу */
func (l *myList) get(index int) int {
	// При выходе индекса за границы выбросить исключение. То же правило действует ниже
	if index < 0 || index >= l.arrSize {
		panic("Индекс за пределами списка")
	}
	return l.arr[index]
}

/* Изменение элемента */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Индекс за пределами списка")
	}
	l.arr[index] = num
}

/* Добавление элемента в конец */
func (l *myList) add(num int) {
	// Если для элементов не хватает места, увеличить ёмкость
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Обновить количество элементов
	l.arrSize++
}

/* Вставка элемента в середину */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Индекс за пределами списка")
	}
	// Если для элементов не хватает места, увеличить ёмкость
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Сдвинуть все элементы начиная с index на одну позицию вправо
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Обновить количество элементов
	l.arrSize++
}

/* Удаление элемента */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("Индекс за пределами списка")
	}
	num := l.arr[index]
	// Сдвинуть все элементы после index на одну позицию влево
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Обновить количество элементов
	l.arrSize--
	// Вернуть удалённый элемент
	return num
}

/* Увеличение ёмкости списка */
func (l *myList) extendCapacity() {
	// Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// Обновить ёмкость списка
	l.arrCapacity = len(l.arr)
}

/* Вернуть список в пределах фактической длины */
func (l *myList) toArray() []int {
	// Преобразовать только используемую часть списка
	return l.arr[:l.arrSize]
}
