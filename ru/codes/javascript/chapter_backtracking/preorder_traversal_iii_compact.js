/**
 * File: preorder_traversal_iii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Предварительный обход: пример 3 */
function preOrder(root, path, res) {
    // Отсечение
    if (root === null || root.val === 3) {
        return;
    }
    // Попытка
    path.push(root);
    if (root.val === 7) {
        // Записать решение
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // Откат
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nИнициализация двоичного дерева');
printTree(root);

// Предварительный обход
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\nВсе пути от корня к узлу 7, не содержащие узлов со значением 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
