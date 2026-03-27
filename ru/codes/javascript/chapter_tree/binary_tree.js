/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Инициализация двоичного дерева */
// Инициализация узла
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// Построить связи между узлами (указатели)
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\nИнициализация двоичного дерева\n');
printTree(n1);

/* Вставка и удаление узлов */
const P = new TreeNode(0);
// Вставить узел P между n1 -> n2
n1.left = P;
P.left = n2;
console.log('\nПосле вставки узла P\n');
printTree(n1);
// Удалить узел P
n1.left = n2;
console.log('\nПосле удаления узла P\n');
printTree(n1);
