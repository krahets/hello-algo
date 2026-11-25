/**
 * File: preorder_traversal_ii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Прямой обход: пример 2 */
function preOrder(root, path, res) {
    if (root === null) {
        return;
    }
    // Пробуем вариант
    path.push(root);
    if (root.val === 7) {
        // Сохраняем решение
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // Возврат
    path.pop();
}

// Основная программа
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nСоздаём двоичное дерево');
printTree(root);

// Прямой обход
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\nВыводим все пути от корня до узлов со значением 7');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
