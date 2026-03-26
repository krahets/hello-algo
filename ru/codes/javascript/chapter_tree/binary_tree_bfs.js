/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Обход по уровням */
function levelOrder(root) {
    // Инициализировать очередь и добавить корневой узел
    const queue = [root];
    // Инициализировать список для хранения последовательности обхода
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // Извлечение из очереди
        list.push(node.val); // Сохранить значение узла
        if (node.left) queue.push(node.left); // Поместить левого потомка в очередь
        if (node.right) queue.push(node.right); // Поместить правого потомка в очередь
    }
    return list;
}

/* Driver Code */
/* Инициализировать двоичное дерево */
// Здесь используется функция, которая напрямую строит двоичное дерево из массива
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nИнициализировать двоичное дерево\n');
printTree(root);

/* Обход по уровням */
const list = levelOrder(root);
console.log('\nПоследовательность узлов при обходе по уровням =' + list);
