// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* Key-value pair */
type pair struct {
	key int
	val string
}

/* Hash table based on array implementation */
type arrayHashMap struct {
	buckets []*pair
}

/* Initialize hash table */
func newArrayHashMap() *arrayHashMap {
	// Initialize array with 100 buckets
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* Hash function */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* Query operation */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* Add operation */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* Remove operation */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// Set to nil to delete
	a.buckets[index] = nil
}

/* Get all key pairs */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* Get all keys */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* Get all values */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* Print hash table */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
