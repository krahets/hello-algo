// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* 키-값 쌍 */
type pair struct {
	key int
	val string
}

/* 배열로 구현한 해시 테이블 */
type arrayHashMap struct {
	buckets []*pair
}

/* 해시 테이블 초기화 */
func newArrayHashMap() *arrayHashMap {
	// 버킷 100개를 포함하는 배열을 초기화한다
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* 해시 함수 */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* 조회 연산 */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "찾을 수 없음"
	}
	return pair.val
}

/* 추가 연산 */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* 삭제 연산 */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// nil로 설정하여 삭제를 나타낸다
	a.buckets[index] = nil
}

/* 모든 키-값 쌍 반환 */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* 모든 키 반환 */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* 모든 값 반환 */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* 해시 테이블 출력 */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
