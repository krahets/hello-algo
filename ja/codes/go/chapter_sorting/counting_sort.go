// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* 計数ソート */
// 簡易実装のため、オブジェクトのソートには使えない
func countingSortNaive(nums []int) {
	// 1. 配列の最大要素 m を求める
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 各数値の出現回数を数える
	// counter[num] は num の出現回数を表す
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. counter を走査し、各要素を元の配列 nums に書き戻す
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* 計数ソート */
// 完全な実装で、オブジェクトをソートでき、かつ安定ソートである
func countingSort(nums []int) {
	// 1. 配列の最大要素 m を求める
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 各数値の出現回数を数える
	// counter[num] は num の出現回数を表す
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. counter の累積和を求めて、「出現回数」を「末尾インデックス」に変換する
	// つまり counter[num]-1 は、num が res に最後に現れるインデックス
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. nums を逆順に走査し、各要素を結果配列 res に格納する
	// 結果を記録するための配列 res を初期化
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// num を対応するインデックスに配置
		res[counter[num]-1] = num
		// 累積和を 1 減らして、次に num を配置するインデックスを得る
		counter[num]--
	}
	// 結果配列 res で元の配列 nums を上書きする
	copy(nums, res)
}
