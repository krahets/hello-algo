// File: hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHashMap(t *testing.T) {
	/* Initialize the hash table */
	hmap := make(map[int]string)

	/* Insert a key-value pair */
	// Insert the pair (key, value) into the hash table
	hmap[12836] = "Xiao Ha"
	hmap[15937] = "Xiao Luo"
	hmap[16750] = "Xiao Suan"
	hmap[13276] = "Xiao Fa"
	hmap[10583] = "Xiao Ya"
	fmt.Println("\nHash table after insertion:\nKey -> Value")
	PrintMap(hmap)

	/* Look up a value */
	// Look up key in the hash table to get value
	name := hmap[15937]
	fmt.Println("\nName for student ID 15937: ", name)

	/* Remove a key-value pair */
	// Remove the pair (key, value) from the hash table
	delete(hmap, 10583)
	fmt.Println("\nHash table after removing 10583:\nKey -> Value")
	PrintMap(hmap)

	/* Iterate over the hash table */
	// Iterate over key-value pairs (key->value)
	fmt.Println("\nIterate over key-value pairs (Key->Value)")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Iterate over keys only
	fmt.Println("\nIterate over keys only")
	for key := range hmap {
		fmt.Println(key)
	}
	// Iterate over values only
	fmt.Println("\nIterate over values only")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 算法"

	hash = addHash(key)
	fmt.Println("Additive hash value: " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Multiplicative hash value: " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR hash value: " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Rotation hash value: " + strconv.Itoa(hash))
}
