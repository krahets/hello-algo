// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* Chained address hash table */
type hashMapChaining struct {
	size        int      // Number of key-value pairs
	capacity    int      // Hash table capacity
	loadThres   float64  // Load factor threshold for triggering expansion
	extendRatio int      // Expansion multiplier
	buckets     [][]pair // Bucket array
}

/* Constructor */
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

/* Hash function */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* Load factor */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* Query operation */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// Traverse the bucket, if the key is found, return the corresponding val
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// If key not found, return an empty string
	return ""
}

/* Add operation */
func (m *hashMapChaining) put(key int, val string) {
	// When the load factor exceeds the threshold, perform expansion
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// Traverse the bucket, if the specified key is encountered, update the corresponding val and return
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// If the key is not found, add the key-value pair to the end
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* Remove operation */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// Traverse the bucket, remove the key-value pair from it
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// Slice removal
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* Extend hash table */
func (m *hashMapChaining) extend() {
	// Temporarily store the original hash table
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// Initialize the extended new hash table
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// Move key-value pairs from the original hash table to the new hash table
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* Print hash table */
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
