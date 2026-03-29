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
	// 二分木を初期化
	// ここでは、配列から直接二分木を生成する関数を利用する
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\n二分木を初期化")
	fmt.Println("二分木の配列表現：")
	fmt.Println(arr)
	fmt.Println("二分木の連結リスト表現：")
	PrintTree(root)

	// 配列表現による二分木クラス
	abt := newArrayBinaryTree(arr)

	// ノードにアクセス
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\n現在のノードのインデックスは", i, "，値は", abt.val(i))
	fmt.Println("左の子ノードのインデックスは", l, "，値は", abt.val(l))
	fmt.Println("右の子ノードのインデックスは", r, "，値は", abt.val(r))
	fmt.Println("親ノードのインデックスは", p, "，値は", abt.val(p))

	// 木を走査
	res := abt.levelOrder()
	fmt.Println("\nレベル順走査：", res)
	res = abt.preOrder()
	fmt.Println("前順走査：", res)
	res = abt.inOrder()
	fmt.Println("中順走査：", res)
	res = abt.postOrder()
	fmt.Println("後順走査：", res)
}
