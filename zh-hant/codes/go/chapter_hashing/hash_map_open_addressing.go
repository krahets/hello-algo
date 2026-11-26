// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* 採用開放定址法的雜湊表 */
type hashMapOpenAddressing struct {
	size        int     // 鍵值對數量
	capacity    int     // 雜湊表容量
	loadThres   float64 // 觸發容量擴充的負載因子門檻
	extendRatio int     // 容量擴充倍數
	buckets     []*pair // 桶陣列
	TOMBSTONE   *pair   // 刪除標記
}

/* 建構方法 */
func newHashMapOpenAddressing() *hashMapOpenAddressing {
	return &hashMapOpenAddressing{
		size:        0,
		capacity:    4,
		loadThres:   2.0 / 3.0,
		extendRatio: 2,
		buckets:     make([]*pair, 4),
		TOMBSTONE:   &pair{-1, "-1"},
	}
}

/* 雜湊函式 */
func (h *hashMapOpenAddressing) hashFunc(key int) int {
	return key % h.capacity // 根據鍵計算雜湊值
}

/* 負載因子 */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // 計算目前的負載因子
}

/* 尋找 key 對應的桶索引 */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // 取得起始索引
	firstTombstone := -1     // 記錄遇到的第一個 TOMBSTONE 的位置
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // 回傳移動後的桶索引
			}
			return index // 回傳找到的索引
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // 記錄遇到的第一個刪除標記的位置
		}
		index = (index + 1) % h.capacity // 進行線性探測，超過尾端就回到開頭
	}
	// 若 key 不存在，回傳可插入位置的索引
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* 查詢操作 */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // 尋找 key 對應的桶索引
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // 若找到鍵值對，回傳對應的 val
	}
	return "" // 若鍵值對不存在，回傳 ""
}

/* 新增操作 */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // 當負載因子超過門檻時，擴充容量
	}
	index := h.findBucket(key) // 尋找 key 對應的桶索引
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // 若鍵值對不存在，新增該鍵值對
		h.size++
	} else {
		h.buckets[index].val = val // 若找到鍵值對，覆寫 val
	}
}

/* 刪除操作 */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // 尋找 key 對應的桶索引
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // 若找到鍵值對，以刪除標記取代它
		h.size--
	}
}

/* 擴充雜湊表容量 */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // 暫存原本的雜湊表
	h.capacity *= h.extendRatio           // 更新容量
	h.buckets = make([]*pair, h.capacity) // 初始化擴充後的新雜湊表
	h.size = 0                            // 重設大小
	// 將鍵值對從原本的雜湊表移到新表
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* 印出雜湊表 */
func (h *hashMapOpenAddressing) print() {
	for _, pair := range h.buckets {
		if pair == nil {
			fmt.Println("nil")
		} else if pair == h.TOMBSTONE {
			fmt.Println("TOMBSTONE")
		} else {
			fmt.Printf("%d -> %s\n", pair.key, pair.val)
		}
	}
}
