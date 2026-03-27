/**
 * File: binary_tree_bfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Обход в ширину */
function levelOrder(root: TreeNode | null): number[] {
    // Инициализировать очередь и добавить корневой узел
    const queue = [root];
    // Инициализировать список для хранения последовательности обхода
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // Извлечение из очереди
        list.push(node.val); // Сохранить значение узла
        if (node.left) {
            queue.push(node.left); // Поместить левый дочерний узел в очередь
        }
        if (node.right) {
            queue.push(node.right); // Поместить правый дочерний узел в очередь
        }
    }
    return list;
}

/* Driver Code */
/* Инициализация двоичного дерева */
// Здесь используется функция, напрямую строящая двоичное дерево из массива
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nИнициализация двоичного дерева\n');
printTree(root);

/* Обход в ширину */
const list = levelOrder(root);
console.log('\nПоследовательность печати узлов при обходе в ширину = ' + list);

export {};
