// File: hash_map_chaining.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"strings"
)

/* 체이닝 해시 테이블 */
type hashMapChaining struct {
	size        int      // 키-값 쌍의 개수
	capacity    int      // 해시 테이블의 용량
	loadThres   float64  // 용량을 늘리는 기준이 되는 적재율
	extendRatio int      // 용량 증가 배수
	buckets     [][]pair // 버킷 배열
}

/* 생성자 */
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

/* 해시 함수 */
func (m *hashMapChaining) hashFunc(key int) int {
	return key % m.capacity
}

/* 적재율 */
func (m *hashMapChaining) loadFactor() float64 {
	return float64(m.size) / float64(m.capacity)
}

/* 조회 */
func (m *hashMapChaining) get(key int) string {
	idx := m.hashFunc(key)
	bucket := m.buckets[idx]
	// 버킷을 순회하다가 key를 찾으면 해당 val 반환
	for _, p := range bucket {
		if p.key == key {
			return p.val
		}
	}
	// key를 찾지 못하면 빈 문자열 반환
	return ""
}

/* 추가 */
func (m *hashMapChaining) put(key int, val string) {
	// 적재율이 임계값을 넘으면 용량 늘리기
	if m.loadFactor() > m.loadThres {
		m.extend()
	}
	idx := m.hashFunc(key)
	// 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
	for i := range m.buckets[idx] {
		if m.buckets[idx][i].key == key {
			m.buckets[idx][i].val = val
			return
		}
	}
	// 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
	p := pair{
		key: key,
		val: val,
	}
	m.buckets[idx] = append(m.buckets[idx], p)
	m.size += 1
}

/* 삭제 */
func (m *hashMapChaining) remove(key int) {
	idx := m.hashFunc(key)
	// 버킷을 순회하며 해당 키-값 쌍 삭제
	for i, p := range m.buckets[idx] {
		if p.key == key {
			// 슬라이스에서 원소 삭제
			m.buckets[idx] = append(m.buckets[idx][:i], m.buckets[idx][i+1:]...)
			m.size -= 1
			break
		}
	}
}

/* 해시 테이블 용량 늘리기 */
func (m *hashMapChaining) extend() {
	// 기존 해시 테이블 임시 보관
	tmpBuckets := make([][]pair, len(m.buckets))
	for i := 0; i < len(m.buckets); i++ {
		tmpBuckets[i] = make([]pair, len(m.buckets[i]))
		copy(tmpBuckets[i], m.buckets[i])
	}
	// 용량을 늘린 새 해시 테이블 초기화
	m.capacity *= m.extendRatio
	m.buckets = make([][]pair, m.capacity)
	for i := 0; i < m.capacity; i++ {
		m.buckets[i] = make([]pair, 0)
	}
	m.size = 0
	// 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
	for _, bucket := range tmpBuckets {
		for _, p := range bucket {
			m.put(p.key, p.val)
		}
	}
}

/* 해시 테이블 출력 */
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
