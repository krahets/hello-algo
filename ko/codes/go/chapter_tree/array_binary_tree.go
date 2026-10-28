// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* 배열로 표현한 이진 트리 클래스 */
type arrayBinaryTree struct {
	tree []any
}

/* 생성자 */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* 리스트 용량 */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* 인덱스가 i인 노드의 값 반환 */
func (abt *arrayBinaryTree) val(i int) any {
	// 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* 레벨 순서 순회 */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// 배열을 직접 순회한다
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* 깊이 우선 순회 */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// 빈칸이면 반환한다
	if abt.val(i) == nil {
		return
	}
	// 전위 순회
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// 중위 순회
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// 후위 순회
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* 전위 순회 */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* 중위 순회 */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* 후위 순회 */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
