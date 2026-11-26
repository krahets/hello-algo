// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* Хеш-таблица с открытой адресацией */
type hashMapOpenAddressing struct {
	size        int     // Число пар «ключ — значение»
	capacity    int     // Ёмкость хеш-таблицы
	loadThres   float64 // Порог коэффициента заполнения для расширения
	extendRatio int     // Во сколько раз увеличивается ёмкость
	buckets     []*pair // Массив корзин
	TOMBSTONE   *pair   // Метка удаления
}

/* Конструктор */
func newHashMapOpenAddressing() *hashMapOpenAddressing {
	return &hashMapOpenAddressing{
		size:        0,
		capacity:    4,
		loadThres:   2.0 / 3.0,
		extendRatio: 2,
		buckets:     make([]*pair, 4),
		TOMBSTONE:   &pair{-1, "-1"},
	}
}

/* Хеш-функция */
func (h *hashMapOpenAddressing) hashFunc(key int) int {
	return key % h.capacity // Вычислить хеш по ключу
}

/* Коэффициент заполнения */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // Вычислить текущий коэффициент заполнения
}

/* Найти индекс корзины для ключа key */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // Получить начальный индекс
	firstTombstone := -1     // Запомнить позицию первой встретившейся метки TOMBSTONE
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// Если ранее встретилась метка удаления, переместить пару на её место
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // Вернуть индекс корзины после перемещения
			}
			return index // Вернуть найденный индекс
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // Запомнить позицию первой встретившейся метки удаления
		}
		index = (index + 1) % h.capacity // Линейное пробирование с переходом из конца массива в начало
	}
	// Если ключа key нет, вернуть индекс для вставки
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* Поиск */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // Найти индекс корзины для ключа key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // Если пара найдена, вернуть её значение val
	}
	return "" // Если пары нет, вернуть ""
}

/* Вставка */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // Расширить таблицу, если коэффициент заполнения превысил порог
	}
	index := h.findBucket(key) // Найти индекс корзины для ключа key
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // Если пары нет, добавить её
		h.size++
	} else {
		h.buckets[index].val = val // Если пара найдена, заменить val
	}
}

/* Удаление */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // Найти индекс корзины для ключа key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // Если пара найдена, заменить её меткой удаления
		h.size--
	}
}

/* Расширить хеш-таблицу */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // Временно сохранить исходную хеш-таблицу
	h.capacity *= h.extendRatio           // Обновить ёмкость
	h.buckets = make([]*pair, h.capacity) // Создать новую таблицу увеличенной ёмкости
	h.size = 0                            // Сбросить число элементов
	// Перенести пары из исходной таблицы в новую
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* Вывести хеш-таблицу */
func (h *hashMapOpenAddressing) print() {
	for _, pair := range h.buckets {
		if pair == nil {
			fmt.Println("nil")
		} else if pair == h.TOMBSTONE {
			fmt.Println("TOMBSTONE")
		} else {
			fmt.Printf("%d -> %s\n", pair.key, pair.val)
		}
	}
}
