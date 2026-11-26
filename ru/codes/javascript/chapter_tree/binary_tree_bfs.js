/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Обход по уровням */
function levelOrder(root) {
    // Создать очередь и добавить корень
    const queue = [root];
    // Создать список для последовательности обхода
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // Извлечь узел из очереди
        list.push(node.val); // Сохранить значение узла
        if (node.left) queue.push(node.left); // Добавить левого потомка в очередь
        if (node.right) queue.push(node.right); // Добавить правого потомка в очередь
    }
    return list;
}

/* Основная программа */
/* Инициализация двоичного дерева */
// Используем функцию, которая строит двоичное дерево непосредственно из массива
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nИнициализация двоичного дерева\n');
printTree(root);

/* Обход по уровням */
const list = levelOrder(root);
console.log('\nУзлы в порядке обхода по уровням = ' + list);
