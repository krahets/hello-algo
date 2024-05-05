// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* Open addressing hash table */
type hashMapOpenAddressing struct {
	size        int     // Number of key-value pairs
	capacity    int     // Hash table capacity
	loadThres   float64 // Load factor threshold for triggering expansion
	extendRatio int     // Expansion multiplier
	buckets     []*pair // Bucket array
	TOMBSTONE   *pair   // Removal mark
}

/* Constructor */
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

/* Hash function */
func (h *hashMapOpenAddressing) hashFunc(key int) int {
	return key % h.capacity // Calculate hash value based on key
}

/* Load factor */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // Calculate the current load factor
}

/* Search for the bucket index corresponding to key */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // Get the initial index
	firstTombstone := -1     // Record the position of the first TOMBSTONE encountered
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// If a removal mark was encountered earlier, move the key-value pair to that index
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // Return the moved bucket index
			}
			return index // Return the found index
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // Record the position of the first removal mark encountered
		}
		index = (index + 1) % h.capacity // Linear probing, return to the beginning if passed the end
	}
	// If the key does not exist, return the index of the insertion point
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* Query operation */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // Search for the bucket index corresponding to key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // If the key-value pair is found, return the corresponding val
	}
	return "" // If the key-value pair does not exist, return ""
}

/* Add operation */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // When the load factor exceeds the threshold, perform expansion
	}
	index := h.findBucket(key) // Search for the bucket index corresponding to key
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // If the key-value pair does not exist, add the key-value pair
		h.size++
	} else {
		h.buckets[index].val = val // If the key-value pair is found, overwrite val
	}
}

/* Remove operation */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // Search for the bucket index corresponding to key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // If the key-value pair is found, cover it with a removal mark
		h.size--
	}
}

/* Extend hash table */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // Temporarily store the original hash table
	h.capacity *= h.extendRatio           // Update capacity
	h.buckets = make([]*pair, h.capacity) // Initialize the extended new hash table
	h.size = 0                            // Reset size
	// Move key-value pairs from the original hash table to the new hash table
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* Print hash table */
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
