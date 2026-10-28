/**
 * File: binary_tree_bfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 레벨 순서 순회 */
function levelOrder(root: TreeNode | null): number[] {
    // 큐를 초기화하고 루트 노드를 넣는다
    const queue = [root];
    // 순회 순서를 저장할 리스트를 초기화한다
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // 큐에서 꺼낸다
        list.push(node.val); // 노드 값을 저장한다
        if (node.left) {
            queue.push(node.left); // 왼쪽 자식 노드를 큐에 삽입한다
        }
        if (node.right) {
            queue.push(node.right); // 오른쪽 자식 노드를 큐에 삽입한다
        }
    }
    return list;
}

/* 실행 코드 */
/* 이진 트리 초기화 */
// 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화\n');
printTree(root);

/* 레벨 순서 순회 */
const list = levelOrder(root);
console.log('\n레벨 순서 순회의 노드 출력 순서 = ' + list);

export {};
