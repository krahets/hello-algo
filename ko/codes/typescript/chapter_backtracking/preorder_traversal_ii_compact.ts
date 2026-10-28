/**
 * File: preorder_traversal_ii_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 전위 순회: 예제 2 */
function preOrder(
    root: TreeNode | null,
    path: TreeNode[],
    res: TreeNode[][]
): void {
    if (root === null) {
        return;
    }
    // 시도
    path.push(root);
    if (root.val === 7) {
        // 해를 기록한다
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // 되돌리기
    path.pop();
}

// 실행 코드
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화');
printTree(root);

// 전위 순회
const path: TreeNode[] = [];
const res: TreeNode[][] = [];
preOrder(root, path, res);

console.log('\n루트 노드에서 노드 7까지의 모든 경로 출력');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
