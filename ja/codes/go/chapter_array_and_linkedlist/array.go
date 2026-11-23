// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* 要素にランダムアクセスする */
func randomAccess(nums []int) (randomNum int) {
	// 区間 [0, nums.length) から数値をランダムに 1 つ選ぶ
	randomIndex := rand.Intn(len(nums))
	// ランダムに選んだ要素を取得して返す
	randomNum = nums[randomIndex]
	return
}

/* 配列の長さを拡張する */
func extend(nums []int, enlarge int) []int {
	// 拡張後の長さの配列を初期化する
	res := make([]int, len(nums)+enlarge)
	// 元の配列の全要素を新しい配列にコピーする
	for i, num := range nums {
		res[i] = num
	}
	// 拡張後の新しい配列を返す
	return res
}

/* 配列のインデックス index に要素 num を挿入する */
func insert(nums []int, num int, index int) {
	// インデックス index 以降の全要素を 1 つ後ろにずらす
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// インデックス index の要素に num を代入する
	nums[index] = num
}

/* インデックス index の要素を削除する */
func remove(nums []int, index int) {
	// インデックス index より後の全要素を 1 つ前にずらす
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 配列を走査する */
func traverse(nums []int) {
	count := 0
	// インデックスを使って配列を走査する
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// 配列の要素を直接走査する
	for _, num := range nums {
		count += num
	}
	// データのインデックスと要素を同時に走査する
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* 配列から指定した要素を探索する */
func find(nums []int, target int) (index int) {
	index = -1
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			index = i
			break
		}
	}
	return
}
