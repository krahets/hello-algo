// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// TreeNode는 이진 트리의 노드다.
type TreeNode struct {
	Val    any       // 노드 값
	Height int       // 노드 높이
	Left   *TreeNode // 왼쪽 자식 노드에 대한 참조
	Right  *TreeNode // 오른쪽 자식 노드에 대한 참조
}

// NewTreeNode는 이진 트리 노드의 생성자다.
func NewTreeNode(v any) *TreeNode {
	return &TreeNode{
		Val:    v,
		Height: 0,
		Left:   nil,
		Right:  nil,
	}
}

// 직렬화 인코딩 규칙은 다음을 참고한다.
// https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
// 이진 트리의 배열 표현:
// [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
// 이진 트리의 연결 리스트 표현:
//
//	         /——— 15
//	     /——— 7
//	 /——— 3
//	|    \——— 6
//	|        \——— 12
//
// ——— 1
//
//	\——— 2
//	   |    /——— 9
//	    \——— 4
//	        \——— 8

// SliceToTreeDFS는 재귀로 리스트를 이진 트리로 역직렬화한다.
func SliceToTreeDFS(arr []any, i int) *TreeNode {
	if i < 0 || i >= len(arr) || arr[i] == nil {
		return nil
	}
	root := NewTreeNode(arr[i])
	root.Left = SliceToTreeDFS(arr, 2*i+1)
	root.Right = SliceToTreeDFS(arr, 2*i+2)
	return root
}

// SliceToTree는 슬라이스를 이진 트리로 역직렬화한다.
func SliceToTree(arr []any) *TreeNode {
	return SliceToTreeDFS(arr, 0)
}

// TreeToSliceDFS는 재귀로 이진 트리를 슬라이스로 직렬화한다.
func TreeToSliceDFS(root *TreeNode, i int, res *[]any) {
	if root == nil {
		return
	}
	for i >= len(*res) {
		*res = append(*res, nil)
	}
	(*res)[i] = root.Val
	TreeToSliceDFS(root.Left, 2*i+1, res)
	TreeToSliceDFS(root.Right, 2*i+2, res)
}

// TreeToSlice는 이진 트리를 슬라이스로 직렬화한다.
func TreeToSlice(root *TreeNode) []any {
	var res []any
	TreeToSliceDFS(root, 0, &res)
	return res
}
