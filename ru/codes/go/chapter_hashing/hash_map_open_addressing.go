// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* Хеш-таблица с открытой адресацией */
type hashMapOpenAddressing struct {
	size        int     // Количество пар ключ-значение
	capacity    int     // Вместимость хеш-таблицы
	loadThres   float64 // Порог коэффициента загрузки, запускающий расширение
	extendRatio int     // Коэффициент расширения
	buckets     []*pair // Массив бакетов
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
	return key % h.capacity // Вычислить хеш-значение по ключу
}

/* Коэффициент загрузки */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // ВычислитьтекущийКоэффициент загрузки
}

/* Найти индекс корзины, соответствующей ключу key */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // Получить начальный индекс
	firstTombstone := -1     // Записать позицию первого встреченного TOMBSTONE
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // Вернуть индекс бакета после перемещения
			}
			return index // Вернуть найденный индекс
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // Записать позицию первой встретившейся метки удаления
		}
		index = (index + 1) % h.capacity // Линейное пробирование: при выходе за конец вернуться к началу
	}
	// Если key не существует, вернуть индекс точки добавления
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* Операция поиска */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // Найти индекс корзины, соответствующей ключу key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // Если пара ключ-значение найдена, вернуть соответствующее val
	}
	return "" // Если пара ключ-значение не существует, вернуть ""
}

/* Операция добавления */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // Когда коэффициент загрузки превышает порог, выполнить расширение
	}
	index := h.findBucket(key) // Найти индекс корзины, соответствующей ключу key
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // Если пара ключ-значение не существует, добавить ее
		h.size++
	} else {
		h.buckets[index].val = val // Если пара ключ-значение найдена, перезаписать val
	}
}

/* Операция удаления */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // Найти индекс корзины, соответствующей ключу key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // Если пара ключ-значение найдена, пометить ее меткой удаления
		h.size--
	}
}

/* Расширить хеш-таблицу */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // Временно сохранить исходную хеш-таблицу
	h.capacity *= h.extendRatio           // Обновить вместимость
	h.buckets = make([]*pair, h.capacity) // Инициализировать новую хеш-таблицу после расширения
	h.size = 0                            // Сбросить размер
	// Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
