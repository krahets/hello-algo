// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* Initialize hash table */
	hmap := newArrayHashMap()

	/* Add operation */
	// Add key-value pair (key, value) to the hash table
	hmap.put(12836, "Ha")
	hmap.put(15937, "Luo")
	hmap.put(16750, "Suan")
	hmap.put(13276, "Fa")
	hmap.put(10583, "Ya")
	fmt.Println("\nAfter adding, the hash table is\nKey -> Value")
	hmap.print()

	/* Query operation */
	// Enter key to the hash table, get value
	name := hmap.get(15937)
	fmt.Println("\nEnter student ID 15937, found name " + name)

	/* Remove operation */
	// Remove key-value pair (key, value) from the hash table
	hmap.remove(10583)
	fmt.Println("\nAfter removing 10583, the hash table is\nKey -> Value")
	hmap.print()

	/* Traverse hash table */
	fmt.Println("\nTraverse key-value pairs Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nIndividually traverse keys Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nIndividually traverse values Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
