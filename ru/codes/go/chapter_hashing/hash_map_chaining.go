// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* Хеш-таблица с цепочками */
type hashMapChaining struct {
	size        int      // Число пар «ключ — значение»
	capacity    int      // Ёмкость хеш-таблицы
	loadThres   float64  // Порог коэффициента заполнения для расширения
	extendRatio int      // Во сколько раз увеличивается ёмкость
	buckets     [][]pair // Массив корзин
}

/* Конструктор */
func newHashMapChaining() *hashMapChaining {
	buckets := make([][]pair, 4)
	for i := 0; i < 4; i++ {
		buckets[i] = make([]pair, 0)
	}
	return &hashMapChaining{
		size:        0,
		capacity:    4,
		loadThres:   2.0 / 3.0,
		extendRatio: 2,
		buckets:     buckets,
	}
}

/* Хеш-функция */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* Коэффициент заполнения */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* Поиск */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// Если ключ key не найден, вернуть пустую строку
	return ""
}

/* Вставка */
func (m *hashMapChaining) put(key int, val string) {
	// Расширить таблицу, если коэффициент заполнения превысил порог
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// Обойти корзину. Если найден ключ key, обновить val и завершить операцию
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// Если ключа key нет, добавить пару в конец списка
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* Удаление */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// Обойти корзину и удалить из неё нужную пару
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// Удалить элемент из среза
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* Расширить хеш-таблицу */
func (m *hashMapChaining) extend() {
	// Временно сохранить исходную хеш-таблицу
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// Создать новую таблицу увеличенной ёмкости
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// Перенести пары из исходной таблицы в новую
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* Вывести хеш-таблицу */
func (m *hashMapChaining) print() {
	var builder strings.Builder

	for _, bucket := range m.buckets {
		builder.WriteString("[")
		for _, p := range bucket {
			builder.WriteString(strconv.Itoa(p.key) + " -> " + p.val + " ")
		}
		builder.WriteString("]")
		fmt.Println(builder.String())
		builder.Reset()
	}
}
