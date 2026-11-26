// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* Initialize the hash table */
	hmap := newArrayHashMap()

	/* Insert a key-value pair */
	// Insert the pair (key, value) into the hash table
	hmap.put(12836, "Xiao Ha")
	hmap.put(15937, "Xiao Luo")
	hmap.put(16750, "Xiao Suan")
	hmap.put(13276, "Xiao Fa")
	hmap.put(10583, "Xiao Ya")
	fmt.Println("\nHash table after insertion:\nKey -> Value")
	hmap.print()

	/* Look up a value */
	// Look up key in the hash table to get value
	name := hmap.get(15937)
	fmt.Println("\nName for student ID 15937: " + name)

	/* Remove a key-value pair */
	// Remove the pair (key, value) from the hash table
	hmap.remove(10583)
	fmt.Println("\nHash table after removing 10583:\nKey -> Value")
	hmap.print()

	/* Iterate over the hash table */
	fmt.Println("\nIterate over key-value pairs (Key->Value)")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nIterate over keys only")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nIterate over values only")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
