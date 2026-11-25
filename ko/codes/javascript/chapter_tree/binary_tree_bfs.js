/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 레벨 순회 */
function levelOrder(root) {
    // 큐를 초기화하고 루트 노드를 넣는다
    const queue = [root];
    // 순회 결과를 저장할 리스트를 초기화한다
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // 큐에서 노드를 꺼낸다
        list.push(node.val); // 노드 값을 저장한다
        if (node.left) queue.push(node.left); // 왼쪽 자식을 큐에 넣는다
        if (node.right) queue.push(node.right); // 오른쪽 자식을 큐에 넣는다
    }
    return list;
}

/* 실행 코드 */
/* 이진 트리 초기화 */
// 배열에서 바로 이진 트리를 만드는 함수를 사용한다
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화\n');
printTree(root);

/* 레벨 순회 */
const list = levelOrder(root);
console.log('\n레벨 순회로 출력한 노드 순서 = ' + list);
