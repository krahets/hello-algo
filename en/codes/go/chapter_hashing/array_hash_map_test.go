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
	hmap.put(12836, "Xiao Ha")
	hmap.put(15937, "Xiao Luo")
	hmap.put(16750, "Xiao Suan")
	hmap.put(13276, "Xiao Fa")
	hmap.put(10583, "Xiao Ya")
	fmt.Println("\nAfter adding is complete, hash table is\nKey -> Value")
	hmap.print()

	/* Query operation */
	// Input key into hash table to get value
	name := hmap.get(15937)
	fmt.Println("\nInput student ID 15937, query name " + name)

	/* Remove operation */
	// Remove key-value pair (key, value) from hash table
	hmap.remove(10583)
	fmt.Println("\nAfter removing 10583, hash table is\nKey -> Value")
	hmap.print()

	/* Traverse hash table */
	fmt.Println("\nTraverse key-value pairs Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nTraverse keys only Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nTraverse values only Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
