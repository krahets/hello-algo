/**
 * File: avl_tree.js
 * Created Time: 2023-02-05
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* АВЛ-дерево*/
class AVLTree {
    /* Конструктор */
    constructor() {
        this.root = null; //Корень
    }

    /* Получить высоту узла */
    height(node) {
        // Высота пустого узла равна -1, высота листа равна 0
        return node === null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    #updateHeight(node) {
        // Высота узла на 1 больше высоты самого высокого поддерева
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    balanceFactor(node) {
        // Коэффициент баланса пустого узла равен 0
        if (node === null) return 0;
        // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
        return this.height(node.left) - this.height(node.right);
    }

    /* Правый поворот */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // Повернуть node вправо вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Вернуть корень поддерева после поворота
        return child;
    }

    /* Левый поворот */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // Повернуть node влево вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Вернуть корень поддерева после поворота
        return child;
    }

    /* Выполнить поворот, чтобы восстановить баланс поддерева */
    #rotate(node) {
        // Получить коэффициент баланса узла node
        const balanceFactor = this.balanceFactor(node);
        // Перевес влево
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Поворот вправо
                return this.#rightRotate(node);
            } else {
                // Сначала поворот влево, затем вправо
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // Перевес вправо
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Поворот влево
                return this.#leftRotate(node);
            } else {
                // Сначала поворот вправо, затем влево
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // Дерево сбалансировано: завершить вызов без поворота
        return node;
    }

    /* Вставка узла */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. Найти место вставки и вставить узел */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // Такой узел уже есть: завершить вызов без вставки
        this.#updateHeight(node); // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = this.#rotate(node);
        // Вернуть корень поддерева
        return node;
    }

    /* Удаление узла */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. Найти и удалить узел */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Нет потомков: удалить node и завершить вызов
                if (child === null) return null;
                // Один потомок: удалить node
                else node = child;
            } else {
                // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = this.#rotate(node);
        // Вернуть корень поддерева
        return node;
    }

    /* Поиск узла */
    search(val) {
        let cur = this.root;
        // Искать в цикле до выхода за пределы листа
        while (cur !== null) {
            // Искомый узел в правом поддереве cur
            if (cur.val < val) cur = cur.right;
            // Искомый узел в левом поддереве cur
            else if (cur.val > val) cur = cur.left;
            // Узел найден: выйти из цикла
            else break;
        }
        // Вернуть искомый узел
        return cur;
    }
}

function testInsert(tree, val) {
    tree.insert(val);
    console.log('\nПосле вставки узла ' + val + ' АВЛ-дерево имеет вид:');
    printTree(tree.root);
}

function testRemove(tree, val) {
    tree.remove(val);
    console.log('\nПосле удаления узла ' + val + ' АВЛ-дерево имеет вид:');
    printTree(tree.root);
}

/* Основная программа */
/* Инициализация пустого АВЛ-дерева */
const avlTree = new AVLTree();
/* Вставка узла */
// Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
testInsert(avlTree, 1);
testInsert(avlTree, 2);
testInsert(avlTree, 3);
testInsert(avlTree, 4);
testInsert(avlTree, 5);
testInsert(avlTree, 8);
testInsert(avlTree, 7);
testInsert(avlTree, 9);
testInsert(avlTree, 10);
testInsert(avlTree, 6);

/* Вставка повторяющегося узла */
testInsert(avlTree, 7);

/* Удаление узла */
// Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
testRemove(avlTree, 8); // Удаление узла без потомков
testRemove(avlTree, 5); // Удаление узла с одним потомком
testRemove(avlTree, 4); // Удаление узла с двумя потомками

/* Поиск узла */
const node = avlTree.search(7);
console.log('\nНайденный узел:', node, 'значение узла = ' + node.val);
