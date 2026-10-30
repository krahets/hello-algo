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

	/* Insert operation */
	// Insert the key-value pair (key, value) into the hash table
	hmap.put(12836, "小哈")
	hmap.put(15937, "小啰")
	hmap.put(16750, "小算")
	hmap.put(13276, "小法")
	hmap.put(10583, "小鸭")
	fmt.Println("\nHash table after insertion:\nKey -> Value")
	hmap.print()

	/* Lookup operation */
	// Look up key in the hash table to obtain value
	name := hmap.get(15937)
	fmt.Println("\nLook up student ID 15937 to obtain the name " + name)

	/* Remove operation */
	// Remove the key-value pair (key, value) from the hash table
	hmap.remove(10583)
	fmt.Println("\nHash table after removing 10583:\nKey -> Value")
	hmap.print()

	/* Traverse the hash table */
	fmt.Println("\nTraverse key-value pairs: Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nTraverse keys only: Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\nTraverse values only: Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
