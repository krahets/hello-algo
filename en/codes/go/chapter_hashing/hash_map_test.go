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

	/* Insert operation */
	// Insert the key-value pair (key, value) into the hash table
	hmap[12836] = "小哈"
	hmap[15937] = "小啰"
	hmap[16750] = "小算"
	hmap[13276] = "小法"
	hmap[10583] = "小鸭"
	fmt.Println("\nHash table after insertion:\nKey -> Value")
	PrintMap(hmap)

	/* Lookup operation */
	// Look up key in the hash table to obtain value
	name := hmap[15937]
	fmt.Println("\nLook up student ID 15937 to obtain the name ", name)

	/* Remove operation */
	// Remove the key-value pair (key, value) from the hash table
	delete(hmap, 10583)
	fmt.Println("\nHash table after removing 10583:\nKey -> Value")
	PrintMap(hmap)

	/* Traverse the hash table */
	// Traverse key-value pairs: key->value
	fmt.Println("\nTraverse key-value pairs: Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// Traverse keys only: key
	fmt.Println("\nTraverse keys only: Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// Traverse values only: value
	fmt.Println("\nTraverse values only: Value")
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
	fmt.Println("Rotating hash value: " + strconv.Itoa(hash))
}
