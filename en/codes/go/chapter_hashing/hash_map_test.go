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
	/* Initialize hash table */
	hmap := make(map[int]string)

	/* Add operation */
	// Add key-value pair (key, value) to the hash table
	hmap[12836] = "Ha"
	hmap[15937] = "Luo"
	hmap[16750] = "Suan"
	hmap[13276] = "Fa"
	hmap[10583] = "Ya"
	fmt.Println("\nAfter adding, the hash table is\nKey -> Value")
	PrintMap(hmap)

	/* Query operation */
	// Enter key to the hash table, get value
	name := hmap[15937]
	fmt.Println("\nEnter student ID 15937, found name ", name)

	/* Remove operation */
	// Remove key-value pair (key, value) from the hash table
	delete(hmap, 10583)
	fmt.Println("\nAfter removing 10583, the hash table is\nKey -> Value")
	PrintMap(hmap)

	/* Traverse hash table */
	// Iterate over key-value pairs key->value
	fmt.Println("\nTraverse key-value pairs Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Iterate over keys only
	fmt.Println("\nIndividually traverse keys Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// Iterate over values only
	fmt.Println("\nIndividually traverse values Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello algorithm"

	hash = addHash(key)
	fmt.Println("Additive hash value is" + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Multiplicative hash value is" + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR hash value is" + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Rotational hash value is" + strconv.Itoa(hash))
}
