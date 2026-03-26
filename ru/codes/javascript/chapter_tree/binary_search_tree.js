/**
 * File: binary_search_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* двоичное дерево поиска */
class BinarySearchTree {
    /* Конструктор */
    constructor() {
        // Инициализировать пустое дерево
        this.root = null;
    }

    /* Получить корневой узел двоичного дерева */
    getRoot() {
        return this.root;
    }

    /* Найти узел */
    search(num) {
        let cur = this.root;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
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

    /* Вставить узел */
    insert(num) {
        // Если дерево пусто, инициализировать корневой узел
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur !== null) {
            // Найти дублирующийся узел и сразу вернуть результат
            if (cur.val === num) return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
            else cur = cur.left;
        }
        // Вставить узел
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }

    /* Удалить узел */
    remove(num) {
        // Если дерево пусто, сразу вернуть результат
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur !== null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val === num) break;
            pre = cur;
            // Удаляемый узел находится в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Удаляемый узел находится в левом поддереве cur
            else cur = cur.left;
        }
        // Если узла для удаления нет, сразу вернуть результат
        if (cur === null) return;
        // Число дочерних узлов = 0 или 1
        if (cur.left === null || cur.right === null) {
            // Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
            const child = cur.left !== null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // Если удаляемый узел является корневым, заново назначить корневой узел
                this.root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            this.remove(tmp.val);
            // Заменить cur значением tmp
            cur.val = tmp.val;
        }
    }
}

/* Driver Code */
/* Инициализировать двоичное дерево поиска */
const bst = new BinarySearchTree();
// Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nИнициализированное двоичное дерево:\n');
printTree(bst.getRoot());

/* Найти узел */
const node = bst.search(7);
console.log('\nНайденный объект узла равен' + node + ', значение узла =' + node.val);

/* Вставить узел */
bst.insert(16);
console.log('\nПосле вставки узла 16 двоичное дерево имеет вид\n');
printTree(bst.getRoot());

/* Удалить узел */
bst.remove(1);
console.log('\nПосле удаления узла 1 двоичное дерево имеет вид\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nПосле удаления узла 2 двоичное дерево имеет вид\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nПосле удаления узла 4 двоичное дерево имеет вид\n');
printTree(bst.getRoot());
