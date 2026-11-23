// File: binary_tree_bfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLevelOrder(t *testing.T) {
	/* 이진 트리 초기화 */
	// 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\n이진 트리 초기화: ")
	PrintTree(root)

	// 레벨 순서 순회
	nums := levelOrder(root)
	fmt.Println("\n레벨 순서 순회의 노드 출력 순서 =", nums)
}
