// Copyright 2022 Cathay.  All rights reserved.
// Use of this source code is governed by a MIT style
// license that can be found in the LICENSE file.

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

func TestWorstBestTimeComplexity(t *testing.T) {
	for i := 0; i < 10; i++ {
		n := 100
		nums := randomNumbers(n)
		index := findOne(nums)
		fmt.Println("打乱后的数组为", nums)
		fmt.Println("数字 1 的索引为", index)
	}
}
