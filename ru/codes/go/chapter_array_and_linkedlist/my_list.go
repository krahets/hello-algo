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
		arr:         make([]int, 10), // Массив (для хранения элементов списка)
		arrSize:     0,               // Длина списка (текущее число элементов)
		extendRatio: 2,               // Коэффициент увеличения списка при каждом расширении
	}
}

/* Получить длину списка (текущее число элементов) */
func (l *myList) size() int {
	return l.arrSize
}

/* Получить вместимость списка */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* Доступ к элементу */
func (l *myList) get(index int) int {
	// Если индекс выходит за границы, выбрасывается исключение; далее аналогично
	if index < 0 || index >= l.arrSize {
		panic("индекс выходит за границы")
	}
	return l.arr[index]
}

/* Обновление элемента */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("индекс выходит за границы")
	}
	l.arr[index] = num
}

/* Добавление элемента в конец */
func (l *myList) add(num int) {
	// При превышении вместимости по числу элементов запускается расширение
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Обновить число элементов
	l.arrSize++
}

/* Вставка элемента в середину */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("индекс выходит за границы")
	}
	// При превышении вместимости по числу элементов запускается расширение
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Обновить число элементов
	l.arrSize++
}

/* Удаление элемента */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("индекс выходит за границы")
	}
	num := l.arr[index]
	// Сдвинуть все элементы после индекса index на одну позицию вперед
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Обновить число элементов
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

/* Вернуть список фактической длины */
func (l *myList) toArray() []int {
	// Преобразовывать только элементы списка в пределах фактической длины
	return l.arr[:l.arrSize]
}
