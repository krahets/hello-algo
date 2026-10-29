// File: array_hash_map.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import "fmt"

/* キーと値のペア */
type pair struct {
	key int
	val string
}

/* 配列で実装したハッシュテーブル */
type arrayHashMap struct {
	buckets []*pair
}

/* ハッシュテーブルを初期化する */
func newArrayHashMap() *arrayHashMap {
	// 100 個のバケットを含む配列を初期化する
	buckets := make([]*pair, 100)
	return &arrayHashMap{buckets: buckets}
}

/* ハッシュ関数 */
func (a *arrayHashMap) hashFunc(key int) int {
	index := key % 100
	return index
}

/* 取得操作 */
func (a *arrayHashMap) get(key int) string {
	index := a.hashFunc(key)
	pair := a.buckets[index]
	if pair == nil {
		return "Not Found"
	}
	return pair.val
}

/* 追加操作 */
func (a *arrayHashMap) put(key int, val string) {
	pair := &pair{key: key, val: val}
	index := a.hashFunc(key)
	a.buckets[index] = pair
}

/* 削除操作 */
func (a *arrayHashMap) remove(key int) {
	index := a.hashFunc(key)
	// nil に設定して、削除を表す
	a.buckets[index] = nil
}

/* すべてのキーと値のペアを取得する */
func (a *arrayHashMap) pairSet() []*pair {
	var pairs []*pair
	for _, pair := range a.buckets {
		if pair != nil {
			pairs = append(pairs, pair)
		}
	}
	return pairs
}

/* すべてのキーを取得する */
func (a *arrayHashMap) keySet() []int {
	var keys []int
	for _, pair := range a.buckets {
		if pair != nil {
			keys = append(keys, pair.key)
		}
	}
	return keys
}

/* すべての値を取得する */
func (a *arrayHashMap) valueSet() []string {
	var values []string
	for _, pair := range a.buckets {
		if pair != nil {
			values = append(values, pair.val)
		}
	}
	return values
}

/* ハッシュテーブルを表示する */
func (a *arrayHashMap) print() {
	for _, pair := range a.buckets {
		if pair != nil {
			fmt.Println(pair.key, "->", pair.val)
		}
	}
}
