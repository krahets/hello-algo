// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* オープンアドレス法のハッシュテーブル */
type hashMapOpenAddressing struct {
	size        int     // キーと値のペアの数
	capacity    int     // ハッシュテーブルの容量
	loadThres   float64 // 容量の拡張を開始する負荷率のしきい値
	extendRatio int     // 容量の拡張倍率
	buckets     []*pair // バケット配列
	TOMBSTONE   *pair   // 削除マーカー
}

/* コンストラクタ */
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

/* ハッシュ関数 */
func (h *hashMapOpenAddressing) hashFunc(key int) int {
	return key % h.capacity // キーからハッシュ値を計算する
}

/* 負荷率 */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // 現在の負荷率を計算する
}

/* key に対応するバケットのインデックスを探索する */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // 初期インデックスを取得する
	firstTombstone := -1     // 最初に見つかった TOMBSTONE の位置を記録する
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // 移動後のバケットのインデックスを返す
			}
			return index // 見つかったインデックスを返す
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // 最初に見つかった削除マーカーの位置を記録する
		}
		index = (index + 1) % h.capacity // 線形探索法で探索し、末尾を越えたら先頭に戻る
	}
	// key が存在しない場合、追加位置のインデックスを返す
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* 取得操作 */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // key に対応するバケットのインデックスを探索する
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // キーと値のペアが見つかった場合、対応する val を返す
	}
	return "" // キーと値のペアが存在しない場合、"" を返す
}

/* 追加操作 */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // 負荷率がしきい値を超えた場合、容量を拡張する
	}
	index := h.findBucket(key) // key に対応するバケットのインデックスを探索する
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // キーと値のペアが存在しない場合、そのペアを追加する
		h.size++
	} else {
		h.buckets[index].val = val // キーと値のペアが見つかった場合、val を上書きする
	}
}

/* 削除操作 */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // key に対応するバケットのインデックスを探索する
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // キーと値のペアが見つかった場合、削除マーカーで上書きする
		h.size--
	}
}

/* ハッシュテーブルの容量を拡張する */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // 元のハッシュテーブルを一時保存する
	h.capacity *= h.extendRatio           // 容量を更新する
	h.buckets = make([]*pair, h.capacity) // 拡張後の新しいハッシュテーブルを初期化する
	h.size = 0                            // サイズをリセットする
	// キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* ハッシュテーブルを表示する */
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
