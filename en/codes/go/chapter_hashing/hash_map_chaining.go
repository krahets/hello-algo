// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* Hash table with chaining */
type hashMapChaining struct {
	size        int      // Number of key-value pairs
	capacity    int      // Hash table capacity
	loadThres   float64  // Load factor threshold for resizing
	extendRatio int      // Growth factor
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

/* Look up a value */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// Scan the bucket and return the corresponding val if key is found
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// Return an empty string if key is absent
	return ""
}

/* Insert a key-value pair */
func (m *hashMapChaining) put(key int, val string) {
	// Expand the table when the load factor exceeds the threshold
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// Scan the bucket. If the specified key is found, update its val and return
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// If key is absent, append the pair to the end of the list
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* Remove a key-value pair */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// Scan the bucket and remove the pair
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// Delete from the slice
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* Expand the hash table */
func (m *hashMapChaining) extend() {
	// Save the original hash table
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// Initialize the larger hash table
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// Move the key-value pairs from the old table into the new one
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* Print the hash table */
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
