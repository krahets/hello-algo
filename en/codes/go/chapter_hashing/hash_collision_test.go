// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* Initialize the hash table */
	hmap := newHashMapChaining()

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
	fmt.Println("\nLook up student ID 15937 to obtain the name", name)

	/* Remove operation */
	// Remove the key-value pair (key, value) from the hash table
	hmap.remove(12836)
	fmt.Println("\nHash table after removing 12836:\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Initialize the hash table */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\nLook up student ID 13276 to obtain the name ", name)

	/* Remove operation */
	// Remove the key-value pair (key, value) from the hash table
	hmap.remove(16750)
	fmt.Println("\nHash table after removing 16750:\nKey -> Value")
	hmap.print()
}
