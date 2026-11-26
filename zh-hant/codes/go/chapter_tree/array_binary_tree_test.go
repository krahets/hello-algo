// File: array_binary_tree_test.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestArrayBinaryTree(t *testing.T) {
	// 初始化二元樹
	// 這裡使用能從陣列直接建立二元樹的函式
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\n初始化二元樹")
	fmt.Println("二元樹的陣列表示法：")
	fmt.Println(arr)
	fmt.Println("二元樹的鏈結串列表示法：")
	PrintTree(root)

	// 以陣列表示二元樹的類別
	abt := newArrayBinaryTree(arr)

	// 存取節點
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\n目前節點的索引為", i, "，值為", abt.val(i))
	fmt.Println("其左子節點的索引為", l, "，值為", abt.val(l))
	fmt.Println("其右子節點的索引為", r, "，值為", abt.val(r))
	fmt.Println("其父節點的索引為", p, "，值為", abt.val(p))

	// 走訪樹
	res := abt.levelOrder()
	fmt.Println("\n層序走訪的結果：", res)
	res = abt.preOrder()
	fmt.Println("前序走訪的結果：", res)
	res = abt.inOrder()
	fmt.Println("中序走訪的結果：", res)
	res = abt.postOrder()
	fmt.Println("後序走訪的結果：", res)
}
