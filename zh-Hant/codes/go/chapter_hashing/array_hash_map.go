// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* 键值对 */
type pair struct {
	key int
	val string
}

/* 基于数组实现的哈希表 */
type arrayHashMap struct {
	buckets []*pair
}

/* 初始化哈希表 */
func newArrayHashMap() *arrayHashMap {
	// 初始化数组，包含 100 个桶
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* 哈希函数 */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* 查询操作 */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* 添加操作 */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* 删除操作 */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// 置为 nil ，代表删除
	a.buckets[index] = nil
}

/* 获取所有键对 */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* 获取所有键 */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* 获取所有值 */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* 打印哈希表 */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
