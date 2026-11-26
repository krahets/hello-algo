// File: stack_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestStack(t *testing.T) {
	/* スタックを初期化する */
	// Go ではスライスをスタックとして使うのが推奨される
	var stack []int

	/* 要素をプッシュする */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("スタック stack = ")
	PrintSlice(stack)

	/* スタックのトップを参照する */
	peek := stack[len(stack)-1]
	fmt.Println("スタックのトップの要素 peek =", peek)

	/* 要素をポップする */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("ポップした要素 pop = ", pop, "、ポップ後の stack = ")
	PrintSlice(stack)

	/* スタックの要素数を取得する */
	size := len(stack)
	fmt.Println("スタックの要素数 size =", size)

	/* 空かどうかを判定する */
	isEmpty := len(stack) == 0
	fmt.Println("スタックは空か =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// スタックを初期化する
	stack := newArrayStack()

	// 要素をプッシュする
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("スタック stack = ")
	PrintSlice(stack.toSlice())

	// スタックのトップを参照する
	peek := stack.peek()
	fmt.Println("スタックのトップの要素 peek =", peek)

	// 要素をポップする
	pop := stack.pop()
	fmt.Print("ポップした要素 pop = ", pop, "、 ポップ後の stack = ")
	PrintSlice(stack.toSlice())

	// スタックの要素数を取得する
	size := stack.size()
	fmt.Println("スタックの要素数 size =", size)

	// 空かどうかを判定する
	isEmpty := stack.isEmpty()
	fmt.Println("スタックは空か =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// スタックを初期化する
	stack := newLinkedListStack()
	// 要素をプッシュする
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("スタック stack = ")
	PrintList(stack.toList())

	// スタックのトップを参照する
	peek := stack.peek()
	fmt.Println("スタックのトップの要素 peek =", peek)

	// 要素をポップする
	pop := stack.pop()
	fmt.Print("ポップした要素 pop = ", pop, "、 ポップ後の stack = ")
	PrintList(stack.toList())

	// スタックの要素数を取得する
	size := stack.size()
	fmt.Println("スタックの要素数 size =", size)

	// 空かどうかを判定する
	isEmpty := stack.isEmpty()
	fmt.Println("スタックは空か =", isEmpty)
}

// M1 Pro 搭載の Mac での BenchmarkArrayStack の測定値は 8 ns/op
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// b.N 回繰り返す
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// M1 Pro 搭載の Mac での BenchmarkLinkedListStack の測定値は 65.02 ns/op
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// b.N 回繰り返す
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
