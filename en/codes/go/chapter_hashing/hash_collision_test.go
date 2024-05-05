// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* Initialize hash table */
	hmap := newHashMapChaining()

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
	fmt.Println("\nInput student number 15937, found name", name)

	/* Remove operation */
	// Remove key-value pair (key, value) from the hash table
	hmap.remove(12836)
	fmt.Println("\nAfter removing 12836, the hash table is\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Initialize hash table */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\nEnter student ID 13276, found name ", name)

	/* Remove operation */
	// Remove key-value pair (key, value) from the hash table
	hmap.remove(16750)
	fmt.Println("\nAfter removing 16750, the hash table is\nKey -> Value")
	hmap.print()
}
