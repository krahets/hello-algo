// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* 键值对 int->String */
type Entry struct {
	key int
	val string
}

/* 基于数组简易实现的哈希表 */
type ArrayHashMap struct {
	bucket []*Entry
}

func newArrayHashMap() *ArrayHashMap {
	// 初始化一个长度为 100 的桶（数组）
	bucket := make([]*Entry, 100)
	return &ArrayHashMap{bucket: bucket}
}

/* 哈希函数 */
func (a *ArrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* 查询操作 */
func (a *ArrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.bucket[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* 添加操作 */
func (a *ArrayHashMap) put(key int, val string) {
	pair := &Entry{key: key, val: val}
	index := a.hashFunc(key)
	a.bucket[index] = pair
}

/* 删除操作 */
func (a *ArrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// 置为空字符，代表删除
	a.bucket[index] = nil
}

/* 获取所有键对 */
func (a *ArrayHashMap) entrySet() []*Entry {
	var pairs []*Entry
	for _, pair := range a.bucket {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* 获取所有键 */
func (a *ArrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.bucket {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* 获取所有值 */
func (a *ArrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.bucket {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* 打印哈希表 */
func (a *ArrayHashMap) print() {
	for _, pair := range a.bucket {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}