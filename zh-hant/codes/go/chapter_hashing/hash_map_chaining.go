// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* 鏈式位址雜湊表 */
type hashMapChaining struct {
	size        int      // 鍵值對數量
	capacity    int      // 雜湊表容量
	loadThres   float64  // 觸發擴容的負載因子閾值
	extendRatio int      // 擴容倍數
	buckets     [][]pair // 桶陣列
}

/* 建構子 */
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

/* 雜湊函式 */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* 負載因子 */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* 查詢操作 */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// 走訪桶，若找到 key ，則返回對應 val
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// 若未找到 key ，則返回空字串
	return ""
}

/* 新增操作 */
func (m *hashMapChaining) put(key int, val string) {
	// 當負載因子超過閾值時，執行擴容
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// 走訪桶，若遇到指定 key ，則更新對應 val 並返回
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// 若無該 key ，則將鍵值對新增至尾部
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* 刪除操作 */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// 走訪桶，從中刪除鍵值對
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// 切片刪除
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* 擴容雜湊表 */
func (m *hashMapChaining) extend() {
	// 暫存原雜湊表
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// 初始化擴容後的新雜湊表
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// 將鍵值對從原雜湊表搬運至新雜湊表
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* 列印雜湊表 */
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
