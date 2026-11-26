/**
 * File: binary_tree_bfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Обход по уровням */
function levelOrder(root: TreeNode | null): number[] {
    // Создать очередь и добавить корень
    const queue = [root];
    // Создать список для последовательности обхода
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // Извлечь узел из очереди
        list.push(node.val); // Сохранить значение узла
        if (node.left) {
            queue.push(node.left); // Добавить левого потомка в очередь
        }
        if (node.right) {
            queue.push(node.right); // Добавить правого потомка в очередь
        }
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

export {};
