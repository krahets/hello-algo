/**
 * File: avl_tree.ts
 * Created Time: 2023-02-06
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* AVL-дерево */
class AVLTree {
    root: TreeNode;
    /* Конструктор */
    constructor() {
        this.root = null; // Корневой узел
    }

    /* Получить высоту узла */
    height(node: TreeNode): number {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node === null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    private updateHeight(node: TreeNode): void {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    balanceFactor(node: TreeNode): number {
        // Коэффициент баланса пустого узла равен 0
        if (node === null) return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return this.height(node.left) - this.height(node.right);
    }

    /* Операция правого вращения */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        this.updateHeight(node);
        this.updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Операция левого вращения */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        this.updateHeight(node);
        this.updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    private rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        const balanceFactor = this.balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Правое вращение
                return this.rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Левое вращение
                return this.leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }

    /* Вставка узла */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    private insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // Повторяющийся узел не вставлять, сразу вернуть
        }
        this.updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = this.rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Удаление узла */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    private removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child === null) {
                    return null;
                } else {
                    // Число дочерних узлов = 1, удалить node напрямую
                    node = child;
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = this.rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Поиск узла */
    search(val: number): TreeNode {
        let cur = this.root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur !== null) {
            if (cur.val < val) {
                // Целевой узел находится в правом поддереве cur
                cur = cur.right;
            } else if (cur.val > val) {
                // Целевой узел находится в левом поддереве cur
                cur = cur.left;
            } else {
                // Найти целевой узел и выйти из цикла
                break;
            }
        }
        // Вернуть целевой узел
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\nПосле вставки узла ' + val + ' AVL-дерево имеет вид');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\nПосле удаления узла ' + val + ' AVL-дерево имеет вид');
    printTree(tree.root);
}

/* Driver Code */
/* Инициализация пустого AVL-дерева */
const avlTree = new AVLTree();
/* Вставка узла */
// Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
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
// Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
testRemove(avlTree, 8); // Удаление узла степени 0
testRemove(avlTree, 5); // Удаление узла степени 1
testRemove(avlTree, 4); // Удаление узла степени 2

/* Поиск узла */
const node = avlTree.search(7);
console.log('\nНайденный объект узла =', node, ', значение узла = ' + node.val);

export {};
