// File: simple_hash.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import "fmt"

/* Аддитивное хеширование */
func addHash(key string) int {
	var hash int64
	var modulus int64

	modulus = 1000000007
	for _, b := range []byte(key) {
		hash = (hash + int64(b)) % modulus
	}
	return int(hash)
}

/* Мультипликативное хеширование */
func mulHash(key string) int {
	var hash int64
	var modulus int64

	modulus = 1000000007
	for _, b := range []byte(key) {
		hash = (31*hash + int64(b)) % modulus
	}
	return int(hash)
}

/* XOR-хеширование */
func xorHash(key string) int {
	hash := 0
	modulus := 1000000007
	for _, b := range []byte(key) {
		fmt.Println(int(b))
		hash ^= int(b)
		hash = (31*hash + int(b)) % modulus
	}
	return hash & modulus
}

/* Хеширование с циклическим сдвигом */
func rotHash(key string) int {
	var hash int64
	var modulus int64

	modulus = 1000000007
	for _, b := range []byte(key) {
		hash = ((hash << 4) ^ (hash >> 28) ^ int64(b)) % modulus
	}
	return int(hash)
}
