// File: hash_map_collision_with_linkedlist.go
// Created Time: 2023-05-18
// Author: msk397 (icbigdata@gmail.com)

package chapter_hashing

import (
	"fmt"
)

/* 基于数组简易实现的哈希表，hash key冲突时，使用链表存储冲突key */
type arrayHashMapWithLinkedList struct {
	buckets []*entryList
}

/* 键值对 int->String */
type entryList struct {
	key int
	val string
	// hash key 冲突时，使用链表连接起来
	next *entryList
}

/* 使用别名，简化变量 */
type myMap = arrayHashMapWithLinkedList

var NotFoundKey = "not_found"

/* 初始化哈希表 */
func newArrayHashMapWithLinkedList(bucketSize int) *myMap {
	// 初始化数组，包含 100 个桶
	buckets := make([]*entryList, bucketSize)
	return &arrayHashMapWithLinkedList{buckets: buckets}
}

/* 哈希函数 */
func (a *myMap) hashFunc(key int) int {
	size := len(a.buckets)
	index := key % size
	return index
}

func (a *myMap) getEntry(key int) *entryList {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return nil
	}
	if pair.key == key {
		return pair
	}
	// 进一步通过链表查询
	for pair.next != nil {
		pair = pair.next
		if pair.key == key {
			return pair
		}
	}
	return nil
}

/* 查询操作 */
func (a *myMap) get(key int) string {
	entry := a.getEntry(key)
	if entry == nil {
		return NotFoundKey
	}
	return entry.val
}

/* 添加操作 */
func (a *myMap) put(key int, val string) {
	entry := a.getEntry(key)
	if entry == nil {
		pair := &entryList{key: key, val: val}
		index := a.hashFunc(key)
		head := a.buckets[index]
		if head != nil {
			// hash key 冲突, 头插法，将新节点插入链表的头部
			pair.next = head
		}
		a.buckets[index] = pair
	} else {
		entry.val = val
	}
}

/* 删除操作 */
func (a *myMap) remove(key int) {
	index := a.hashFunc(key)
	// 置为 nil ，代表删除
	pair := a.buckets[index]
	if pair == nil {
		return
	}
	if pair.key == key {
		next := pair.next
		a.buckets[index] = next
	} else {
		pre := pair
		for pair.next != nil {
			pair = pair.next
			if pair.key == key {
				pre.next = pair.next
				return
			}
			pre = pair
		}
	}
}

/* 获取所有键对 */
func (a *myMap) entrySet() []*entry {
	var pairs []*entry
	for _, pair := range a.buckets {
		for pair != nil {
			e := &entry{pair.key, pair.val}
			pairs = append(pairs, e)
			pair = pair.next
		}
	}
	return pairs
}

/* 获取所有键 */
func (a *myMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		for pair != nil {
			keys = append(keys, pair.key)
			pair = pair.next
		}
	}
	return keys
}

/* 获取所有值 */
func (a *myMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		for pair != nil {
			values = append(values, pair.val)
			pair = pair.next
		}
	}
	return values
}

/* 打印哈希表 */
func (a *myMap) print() {
	for _, pair := range a.buckets {
		for pair != nil {
			fmt.Println(pair.key, "->", pair.val)
			pair = pair.next
		}
	}
}
