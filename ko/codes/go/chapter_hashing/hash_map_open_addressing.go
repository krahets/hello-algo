// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* 개방 주소법 해시 테이블 */
type hashMapOpenAddressing struct {
	size        int     // 키-값 쌍 개수
	capacity    int     // 해시 테이블 용량
	loadThres   float64 // 용량 확장을 수행하는 적재율 임계값
	extendRatio int     // 용량 확장 배수
	buckets     []*pair // 버킷 배열
	TOMBSTONE   *pair   // 삭제 표시
}

/* 생성자 */
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

/* 해시 함수 */
func (h *hashMapOpenAddressing) hashFunc(key int) int {
	return key % h.capacity // 키를 바탕으로 해시값을 계산한다
}

/* 적재율 */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // 현재 적재율을 계산한다
}

/* key에 해당하는 버킷 인덱스 탐색 */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // 초기 인덱스를 구한다
	firstTombstone := -1     // 처음 만난 TOMBSTONE의 위치를 기록한다
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // 옮긴 후의 버킷 인덱스를 반환한다
			}
			return index // 찾은 인덱스를 반환한다
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // 처음 만난 삭제 표시의 위치를 기록한다
		}
		index = (index + 1) % h.capacity // 선형 탐사를 수행하며, 끝을 넘어가면 처음으로 돌아온다
	}
	// key가 없으면 추가할 위치의 인덱스를 반환한다
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* 조회 연산 */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // key에 해당하는 버킷 인덱스 탐색
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // 키-값 쌍을 찾으면 해당 val을 반환한다
	}
	return "" // 키-값 쌍이 없으면 ""를 반환한다
}

/* 추가 연산 */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // 적재율이 임계값을 초과하면 용량을 확장한다
	}
	index := h.findBucket(key) // key에 해당하는 버킷 인덱스 탐색
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
		h.size++
	} else {
		h.buckets[index].val = val // 키-값 쌍을 찾으면 val을 덮어쓴다
	}
}

/* 삭제 연산 */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // key에 해당하는 버킷 인덱스 탐색
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
		h.size--
	}
}

/* 해시 테이블 용량 확장 */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // 원래 해시 테이블을 임시로 저장한다
	h.capacity *= h.extendRatio           // 용량을 갱신한다
	h.buckets = make([]*pair, h.capacity) // 용량을 확장한 새 해시 테이블을 초기화한다
	h.size = 0                            // 크기를 초기화한다
	// 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* 해시 테이블 출력 */
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
