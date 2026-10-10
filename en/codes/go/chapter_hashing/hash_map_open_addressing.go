// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* Hash table with open addressing */
type hashMapOpenAddressing struct {
	size        int     // Number of key-value pairs
	capacity    int     // Hash table capacity
	loadThres   float64 // Load factor threshold for triggering expansion
	extendRatio int     // Expansion multiplier
	buckets     []*pair // Bucket array
	TOMBSTONE   *pair   // Removal marker
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
	return float64(h.size) / float64(h.capacity) // Calculate current load factor
}

/* Search for bucket index corresponding to key */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // Get initial index
	firstTombstone := -1     // Record position of first TOMBSTONE encountered
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// If a removal marker was encountered before, move the key-value pair to that index
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // Return the moved bucket index
			}
			return index // Return found index
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // Record position of first deletion marker encountered
		}
		index = (index + 1) % h.capacity // Linear probing, wrap around to head if past tail
	}
	// If key does not exist, return the index for insertion
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* Query operation */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // Search for bucket index corresponding to key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // If key-value pair is found, return corresponding val
	}
	return "" // Return "" if key-value pair does not exist
}

/* Add operation */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // When load factor exceeds threshold, perform expansion
	}
	index := h.findBucket(key) // Search for bucket index corresponding to key
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // If key-value pair does not exist, add the key-value pair
		h.size++
	} else {
		h.buckets[index].val = val // If key-value pair found, overwrite val
	}
}

/* Remove operation */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // Search for bucket index corresponding to key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // If key-value pair is found, overwrite it with removal marker
		h.size--
	}
}

/* Expand hash table */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // Temporarily store the original hash table
	h.capacity *= h.extendRatio           // Update capacity
	h.buckets = make([]*pair, h.capacity) // Initialize expanded new hash table
	h.size = 0                            // Reset size
	// Move key-value pairs from original hash table to new hash table
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
