/**
 * File: binary_search_tree.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Двоичное дерево поиска */
class BinarySearchTree {
    private root: TreeNode | null;

    /* Конструктор */
    constructor() {
        // Инициализировать пустое дерево
        this.root = null;
    }

    /* Получить корневой узел двоичного дерева */
    getRoot(): TreeNode | null {
        return this.root;
    }

    /* Поиск узла */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > num) cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else break;
        }
        // Вернуть целевой узел
        return cur;
    }

    /* Вставка узла */
    insert(num: number): void {
        // Если дерево пусто, инициализировать корневой узел
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur.val === num) return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
            else cur = cur.left;
        }
        // Вставка узла
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }

    /* Удаление узла */
    remove(num: number): void {
        // Если дерево пусто, сразу вернуть
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val === num) break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Узел для удаления находится в левом поддереве cur
            else cur = cur.left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur === null) return;
        // Число дочерних узлов = 0 или 1
        if (cur.left === null || cur.right === null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                this.root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Рекурсивно удалить узел tmp
            this.remove(tmp!.val);
            // Перезаписать cur значением tmp
            cur.val = tmp!.val;
        }
    }
}

/* Driver Code */
/* Инициализация двоичного дерева поиска */
const bst = new BinarySearchTree();
// Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nИнициализированное двоичное дерево\n');
printTree(bst.getRoot());

/* Поиск узла */
const node = bst.search(7);
console.log(
    '\nНайденный объект узла = ' + node + ', значение узла = ' + (node ? node.val : 'null')
);

/* Вставка узла */
bst.insert(16);
console.log('\nПосле вставки узла 16 двоичное дерево имеет вид\n');
printTree(bst.getRoot());

/* Удаление узла */
bst.remove(1);
console.log('\nПосле удаления узла 1 двоичное дерево имеет вид\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nПосле удаления узла 2 двоичное дерево имеет вид\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nПосле удаления узла 4 двоичное дерево имеет вид\n');
printTree(bst.getRoot());

export {};
