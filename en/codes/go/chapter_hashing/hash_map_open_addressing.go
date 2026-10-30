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
	loadThres   float64 // Load factor threshold that triggers capacity growth
	extendRatio int     // Capacity growth factor
	buckets     []*pair // Bucket array
	TOMBSTONE   *pair   // Tombstone marker
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
	return key % h.capacity // Calculate the hash value from the key
}

/* Load factor */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // Calculate the current load factor
}

/* Find the bucket index for key */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // Get the initial index
	firstTombstone := -1     // Record the position of the first TOMBSTONE encountered
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// If a tombstone was encountered earlier, move the key-value pair to that index
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // Return the bucket index after the move
			}
			return index // Return the index found
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // Record the position of the first tombstone encountered
		}
		index = (index + 1) % h.capacity // Probe linearly, wrapping to the beginning after the end
	}
	// If key is absent, return the index for insertion
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* Lookup operation */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // Find the bucket index for key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // If the key-value pair is found, return its val
	}
	return "" // If the key-value pair is absent, return ""
}

/* Insert operation */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // Grow the capacity when the load factor exceeds the threshold
	}
	index := h.findBucket(key) // Find the bucket index for key
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // If the key-value pair is absent, insert it
		h.size++
	} else {
		h.buckets[index].val = val // If the key-value pair is found, overwrite val
	}
}

/* Remove operation */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // Find the bucket index for key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // If the key-value pair is found, replace it with a tombstone
		h.size--
	}
}

/* Grow the hash table capacity */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // Keep a reference to the original hash table
	h.capacity *= h.extendRatio           // Update the capacity
	h.buckets = make([]*pair, h.capacity) // Initialize a new hash table with the expanded capacity
	h.size = 0                            // Reset the size
	// Move the key-value pairs from the original hash table to the new one
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* Print the hash table */
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
