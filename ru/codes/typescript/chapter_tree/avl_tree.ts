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
        this.root = null; // корневой узел
    }

    /* Получить высоту узла */
    height(node: TreeNode): number {
        // Высота пустого узла равна -1, а высота листа равна 0
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
        // Баланс-фактор пустого узла равен 0
        if (node === null) return 0;
        // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
        return this.height(node.left) - this.height(node.right);
    }

    /* Операция правого поворота */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Используя child как опорную точку, выполнить правый поворот node
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        this.updateHeight(node);
        this.updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Операция левого поворота */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Используя child как опорную точку, выполнить левый поворот node
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        this.updateHeight(node);
        this.updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Выполнить поворот, чтобы восстановить баланс этого поддерева */
    private rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        const balanceFactor = this.balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Правый поворот
                return this.rightRotate(node);
            } else {
                // Сначала выполнить левый поворот, затем правый
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Левый поворот
                return this.leftRotate(node);
            } else {
                // Сначала выполнить правый поворот, затем левый
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
        return node;
    }

    /* Вставить узел */
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
            return node; // Дублирующийся узел не вставлять, сразу вернуть результат
        }
        this.updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = this.rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Удалить узел */
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
                // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                if (child === null) {
                    return null;
                } else {
                    // Если число дочерних узлов равно 1, сразу удалить node
                    node = child;
                }
            } else {
                // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = this.rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Найти узел */
    search(val: number): TreeNode {
        let cur = this.root;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
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
/* Инициализировать пустое AVL-дерево */
const avlTree = new AVLTree();
/* Вставить узел */
// Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
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

/* Вставить повторяющийся узел */
testInsert(avlTree, 7);

/* Удалить узел */
// Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
testRemove(avlTree, 8); // Удалить узел степени 0
testRemove(avlTree, 5); // Удалить узел степени 1
testRemove(avlTree, 4); // Удалить узел степени 2

/* Найти узел */
const node = avlTree.search(7);
console.log('\nНайденный объект узла равен', node, ', значение узла =' + node.val);

export {};
