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
	hmap[12836] = "Xiao Ha"
	hmap[15937] = "Xiao Luo"
	hmap[16750] = "Xiao Suan"
	hmap[13276] = "Xiao Fa"
	hmap[10583] = "Xiao Ya"
	fmt.Println("\nAfter adding is complete, hash table is\nKey -> Value")
	PrintMap(hmap)

	/* Query operation */
	// Input key into hash table to get value
	name := hmap[15937]
	fmt.Println("\nInput student ID 15937, query name ", name)

	/* Remove operation */
	// Remove key-value pair (key, value) from hash table
	delete(hmap, 10583)
	fmt.Println("\nAfter removing 10583, hash table is\nKey -> Value")
	PrintMap(hmap)

	/* Traverse hash table */
	// Traverse key-value pairs
	fmt.Println("\nTraverse key-value pairs Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Traverse keys only
	fmt.Println("\nTraverse keys only Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// Traverse values only
	fmt.Println("\nTraverse values only Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello Algo"

	hash = addHash(key)
	fmt.Println("Additive hash value is " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("Multiplicative hash value is " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR hash value is " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("Rotational hash value is " + strconv.Itoa(hash))
}
