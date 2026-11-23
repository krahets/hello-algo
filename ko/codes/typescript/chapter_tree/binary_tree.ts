/**
 * File: binary_tree.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 이진 트리 초기화 */
// 노드 초기화
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 노드 사이의 참조(포인터)를 설정한다
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\n이진 트리 초기화\n');
printTree(n1);

/* 노드 삽입과 삭제 */
const P = new TreeNode(0);
// n1 -> n2 사이에 노드 P를 삽입한다
n1.left = P;
P.left = n2;
console.log('\n노드 P를 삽입한 후\n');
printTree(n1);
// 노드 P를 삭제한다
n1.left = n2;
console.log('\n노드 P를 삭제한 후\n');
printTree(n1);

export {};
