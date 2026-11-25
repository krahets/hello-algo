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
	fmt.Println("\nName for student ID 15937:", name)

	/* Remove a key-value pair */
	// Remove the pair (key, value) from the hash table
	hmap.remove(12836)
	fmt.Println("\nHash table after removing 12836:\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* Initialize the hash table */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\nName for student ID 13276: ", name)

	/* Remove a key-value pair */
	// Remove the pair (key, value) from the hash table
	hmap.remove(16750)
	fmt.Println("\nHash table after removing 16750:\nKey -> Value")
	hmap.print()
}
