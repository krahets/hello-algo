/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// 순회 순서를 저장할 리스트를 초기화한다
const list: number[] = [];

/* 전위 순회 */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* 중위 순회 */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* 후위 순회 */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* 실행 코드 */
/* 이진 트리 초기화 */
// 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화\n');
printTree(root);

/* 전위 순회 */
list.length = 0;
preOrder(root);
console.log('\n전위 순회의 노드 출력 순서 = ' + list);

/* 중위 순회 */
list.length = 0;
inOrder(root);
console.log('\n중위 순회의 노드 출력 순서 = ' + list);

/* 후위 순회 */
list.length = 0;
postOrder(root);
console.log('\n후위 순회의 노드 출력 순서 = ' + list);

export {};
