/**
 * File: binary_tree_dfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

// Инициализировать список для хранения последовательности обхода
const list = [];

/* Прямой обход */
function preOrder(root) {
    if (root === null) return;
    // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* Симметричный обход */
function inOrder(root) {
    if (root === null) return;
    // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Обратный обход */
function postOrder(root) {
    if (root === null) return;
    // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Driver Code */
/* Инициализировать двоичное дерево */
// Здесь используется функция, которая напрямую строит двоичное дерево из массива
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nИнициализировать двоичное дерево\n');
printTree(root);

/* Прямой обход */
list.length = 0;
preOrder(root);
console.log('\nПоследовательность узлов при прямом обходе =' + list);

/* Симметричный обход */
list.length = 0;
inOrder(root);
console.log('\nПоследовательность узлов при симметричном обходе =' + list);

/* Обратный обход */
list.length = 0;
postOrder(root);
console.log('\nПоследовательность узлов при обратном обходе =' + list);
