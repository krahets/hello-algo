/**
 * File: avl_tree.js
 * Created Time: 2023-02-05
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* AVL 树*/
class AVLTree {
    /* 构造方法 */
    constructor() {
        this.root = null; //根节点
    }

    /* 获取节点高度 */
    height(node) {
        // 空节点高度为 -1 ，叶节点高度为 0
        return node === null ? -1 : node.height;
    }

    /* 更新节点高度 */
    #updateHeight(node) {
        // 节点高度等于最高子树高度 + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* 获取平衡因子 */
    balanceFactor(node) {
        // 空节点平衡因子为 0
        if (node === null) return 0;
        // 节点平衡因子 = 左子树高度 - 右子树高度
        return this.height(node.left) - this.height(node.right);
    }

    /* 右旋操作 */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // 以 child 为原点，将 node 向右旋转
        child.right = node;
        node.left = grandChild;
        // 更新节点高度
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 返回旋转后子树的根节点
        return child;
    }

    /* 左旋操作 */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // 以 child 为原点，将 node 向左旋转
        child.left = node;
        node.right = grandChild;
        // 更新节点高度
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 返回旋转后子树的根节点
        return child;
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    #rotate(node) {
        // 获取节点 node 的平衡因子
        const balanceFactor = this.balanceFactor(node);
        // 左偏树
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右旋
                return this.#rightRotate(node);
            } else {
                // 先左旋后右旋
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // 右偏树
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // 左旋
                return this.#leftRotate(node);
            } else {
                // 先右旋后左旋
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // 平衡树，无须旋转，直接返回
        return node;
    }

    /* 插入节点 */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* 递归插入节点（辅助方法） */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. 查找插入位置并插入节点 */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // 重复节点不插入，直接返回
        this.#updateHeight(node); // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = this.#rotate(node);
        // 返回子树的根节点
        return node;
    }

    /* 删除节点 */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* 递归删除节点（辅助方法） */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. 查找节点并删除 */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子节点数量 = 0 ，直接删除 node 并返回
                if (child === null) return null;
                // 子节点数量 = 1 ，直接删除 node
                else node = child;
            } else {
                // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = this.#rotate(node);
        // 返回子树的根节点
        return node;
    }

    /* 查找节点 */
    search(val) {
        let cur = this.root;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < val) cur = cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > val) cur = cur.left;
            // 找到目标节点，跳出循环
            else break;
        }
        // 返回目标节点
        return cur;
    }
}

function testInsert(tree, val) {
    tree.insert(val);
    console.log('\n插入节点 ' + val + ' 后，AVL 树为');
    printTree(tree.root);
}

function testRemove(tree, val) {
    tree.remove(val);
    console.log('\n删除节点 ' + val + ' 后，AVL 树为');
    printTree(tree.root);
}

/* Driver Code */
/* 初始化空 AVL 树 */
const avlTree = new AVLTree();
/* 插入节点 */
// 请关注插入节点后，AVL 树是如何保持平衡的
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

/* 插入重复节点 */
testInsert(avlTree, 7);

/* 删除节点 */
// 请关注删除节点后，AVL 树是如何保持平衡的
testRemove(avlTree, 8); // 删除度为 0 的节点
testRemove(avlTree, 5); // 删除度为 1 的节点
testRemove(avlTree, 4); // 删除度为 2 的节点

/* 查询节点 */
const node = avlTree.search(7);
console.log('\n查找到的节点对象为', node, '，节点值 = ' + node.val);
