/**
 * File: preorder_traversal_i_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 전위 순회: 예제 1 */
function preOrder(root, res) {
    if (root === null) {
        return;
    }
    if (root.val === 7) {
        // 해를 기록한다
        res.push(root);
    }
    preOrder(root.left, res);
    preOrder(root.right, res);
}

// 실행 코드
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화');
printTree(root);

// 전위 순회
const res = [];
preOrder(root, res);

console.log('\n값이 7인 모든 노드 출력');
console.log(res.map((node) => node.val));
