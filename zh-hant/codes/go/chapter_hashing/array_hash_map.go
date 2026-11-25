// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* 鍵值對 */
type pair struct {
	key int
	val string
}

/* 以陣列實作的雜湊表 */
type arrayHashMap struct {
	buckets []*pair
}

/* 初始化雜湊表 */
func newArrayHashMap() *arrayHashMap {
	// 初始化包含 100 個桶的陣列
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* 雜湊函式 */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* 查詢操作 */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* 新增操作 */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* 刪除操作 */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// 設為 nil，表示刪除
	a.buckets[index] = nil
}

/* 取得所有鍵值對 */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* 取得所有鍵 */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* 取得所有值 */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* 印出雜湊表 */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
