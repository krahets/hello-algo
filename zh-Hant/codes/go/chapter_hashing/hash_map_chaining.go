// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* 链式地址哈希表 */
type hashMapChaining struct {
	size        int      // 键值对数量
	capacity    int      // 哈希表容量
	loadThres   float64  // 触发扩容的负载因子阈值
	extendRatio int      // 扩容倍数
	buckets     [][]pair // 桶数组
}

/* 构造方法 */
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

/* 哈希函数 */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* 负载因子 */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* 查询操作 */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// 遍历桶，若找到 key ，则返回对应 val
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// 若未找到 key ，则返回空字符串
	return ""
}

/* 添加操作 */
func (m *hashMapChaining) put(key int, val string) {
	// 当负载因子超过阈值时，执行扩容
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// 遍历桶，若遇到指定 key ，则更新对应 val 并返回
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// 若无该 key ，则将键值对添加至尾部
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* 删除操作 */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// 遍历桶，从中删除键值对
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// 切片删除
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* 扩容哈希表 */
func (m *hashMapChaining) extend() {
	// 暂存原哈希表
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// 初始化扩容后的新哈希表
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// 将键值对从原哈希表搬运至新哈希表
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* 打印哈希表 */
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
