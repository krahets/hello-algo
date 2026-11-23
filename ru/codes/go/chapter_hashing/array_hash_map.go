// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* Пара ключ-значение */
type pair struct {
	key int
	val string
}

/* Хеш-таблица на основе массива */
type arrayHashMap struct {
	buckets []*pair
}

/* Инициализация хеш-таблицы */
func newArrayHashMap() *arrayHashMap {
	// Инициализировать массив, содержащий 100 корзин
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* Хеш-функция */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* Операция поиска */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* Операция добавления */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* Операция удаления */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// Присвоить nil, что означает удаление
	a.buckets[index] = nil
}

/* Получить все ключи */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* Получить все ключи */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* Получить все значения */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* Вывести хеш-таблицу */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
