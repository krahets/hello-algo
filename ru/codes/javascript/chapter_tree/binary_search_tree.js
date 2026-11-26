/**
 * File: binary_search_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Двоичное дерево поиска */
class BinarySearchTree {
    /* Конструктор */
    constructor() {
        // Инициализация пустого дерева
        this.root = null;
    }

    /* Получить корень двоичного дерева */
    getRoot() {
        return this.root;
    }

    /* Поиск узла */
    search(num) {
        let cur = this.root;
        // Искать в цикле до выхода за пределы листа
        while (cur !== null) {
            // Искомый узел в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Искомый узел в левом поддереве cur
            else if (cur.val > num) cur = cur.left;
            // Узел найден: выйти из цикла
            else break;
        }
        // Вернуть искомый узел
        return cur;
    }

    /* Вставка узла */
    insert(num) {
        // Если дерево пусто, создать корень
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // Искать в цикле до выхода за пределы листа
        while (cur !== null) {
            // Такой узел уже есть: завершить вызов
            if (cur.val === num) return;
            pre = cur;
            // Место вставки в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Место вставки в левом поддереве cur
            else cur = cur.left;
        }
        // Вставка узла
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }

    /* Удаление узла */
    remove(num) {
        // Если дерево пусто, сразу завершить вызов
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // Искать в цикле до выхода за пределы листа
        while (cur !== null) {
            // Узел для удаления найден: выйти из цикла
            if (cur.val === num) break;
            pre = cur;
            // Узел для удаления в правом поддереве cur
            if (cur.val < num) cur = cur.right;
            // Узел для удаления в левом поддереве cur
            else cur = cur.left;
        }
        // Если узел для удаления не найден, завершить вызов
        if (cur === null) return;
        // Число потомков равно 0 или 1
        if (cur.left === null || cur.right === null) {
            // Если потомков нет, child = null, если потомок один, child указывает на него
            const child = cur.left !== null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // Если удаляется корень, назначить новый корень
                this.root = child;
            }
        }
        // Число потомков равно 2
        else {
            // Найти следующий за cur узел в порядке симметричного обхода
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            this.remove(tmp.val);
            // Заменить значение cur значением tmp
            cur.val = tmp.val;
        }
    }
}

/* Основная программа */
/* Инициализация двоичного дерева поиска */
const bst = new BinarySearchTree();
// От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nИсходное двоичное дерево:\n');
printTree(bst.getRoot());

/* Поиск узла */
const node = bst.search(7);
console.log('\nНайденный узел: ' + node + ', значение узла = ' + node.val);

/* Вставка узла */
bst.insert(16);
console.log('\nДвоичное дерево после вставки узла 16:\n');
printTree(bst.getRoot());

/* Удаление узла */
bst.remove(1);
console.log('\nДвоичное дерево после удаления узла 1:\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nДвоичное дерево после удаления узла 2:\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nДвоичное дерево после удаления узла 4:\n');
printTree(bst.getRoot());
