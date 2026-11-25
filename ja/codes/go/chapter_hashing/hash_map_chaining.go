// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* チェイン法によるハッシュ表 */
type hashMapChaining struct {
	size        int      // キーと値のペアの数
	capacity    int      // ハッシュ表の容量
	loadThres   float64  // 表を拡張する負荷率のしきい値
	extendRatio int      // 容量の拡張倍率
	buckets     [][]pair // バケットの配列
}

/* コンストラクタ */
func newHashMapChaining() *hashMapChaining {
	buckets := make([][]pair, 4)
	for i := 0; i < 4; i++ {
		buckets[i] = make([]pair, 0)
	}
	return &hashMapChaining{
		size:        0,
		capacity:    4,
		loadThres:   2.0 / 3.0,
		extendRatio: 2,
		buckets:     buckets,
	}
}

/* ハッシュ関数 */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* 負荷率 */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* 検索 */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// バケットを走査し、key が見つかったら対応する val を返す
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// key が見つからなければ空文字列を返す
	return ""
}

/* 追加 */
func (m *hashMapChaining) put(key int, val string) {
	// 負荷率がしきい値を超えたら表を拡張する
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// key がなければ末尾にペアを追加する
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* 削除 */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// バケットを走査し、該当するペアを削除する
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// スライスから削除する
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* ハッシュ表を拡張する */
func (m *hashMapChaining) extend() {
	// 元のハッシュ表を一時保存する
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// 拡張後の新しいハッシュ表を初期化する
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// 元のハッシュ表から新しい表にペアを移す
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* ハッシュ表を表示する */
func (m *hashMapChaining) print() {
	var builder strings.Builder

	for _, bucket := range m.buckets {
		builder.WriteString("[")
		for _, p := range bucket {
			builder.WriteString(strconv.Itoa(p.key) + " -> " + p.val + " ")
		}
		builder.WriteString("]")
		fmt.Println(builder.String())
		builder.Reset()
	}
}
