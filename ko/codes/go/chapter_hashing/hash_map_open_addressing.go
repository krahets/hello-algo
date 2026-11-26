// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* 개방 주소법 해시 테이블 */
type hashMapOpenAddressing struct {
	size        int     // 키-값 쌍의 개수
	capacity    int     // 해시 테이블의 용량
	loadThres   float64 // 용량을 늘리는 기준이 되는 적재율
	extendRatio int     // 용량 증가 배수
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
	return key % h.capacity // 키로 해시값 계산
}

/* 적재율 */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // 현재 적재율 계산
}

/* key에 해당하는 버킷 인덱스 찾기 */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // 시작 인덱스 구하기
	firstTombstone := -1     // 처음 만난 TOMBSTONE의 위치 기록
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // 옮긴 뒤의 버킷 인덱스 반환
			}
			return index // 찾은 인덱스 반환
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // 처음 만난 삭제 표시의 위치 기록
		}
		index = (index + 1) % h.capacity // 선형 탐사 중 끝을 지나면 처음으로 돌아감
	}
	// key가 없으면 삽입할 위치의 인덱스 반환
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* 조회 */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // key에 해당하는 버킷 인덱스 찾기
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // 키-값 쌍을 찾으면 해당 val 반환
	}
	return "" // 키-값 쌍이 없으면 "" 반환
}

/* 추가 */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // 적재율이 임계값을 넘으면 용량 늘리기
	}
	index := h.findBucket(key) // key에 해당하는 버킷 인덱스 찾기
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // 키-값 쌍이 없으면 새로 추가
		h.size++
	} else {
		h.buckets[index].val = val // 키-값 쌍을 찾으면 val 덮어쓰기
	}
}

/* 삭제 */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // key에 해당하는 버킷 인덱스 찾기
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
		h.size--
	}
}

/* 해시 테이블 용량 늘리기 */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // 기존 해시 테이블 임시 보관
	h.capacity *= h.extendRatio           // 용량 갱신
	h.buckets = make([]*pair, h.capacity) // 용량을 늘린 새 해시 테이블 초기화
	h.size = 0                            // 크기 초기화
	// 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
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
