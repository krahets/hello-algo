/**
 * File: avl_tree.ts
 * Created Time: 2023-02-06
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* AVL 树*/
class AVLTree {
    root: TreeNode;
    /*构造方法*/
    constructor() {
        this.root = null; //根结点
    }

    /* 获取结点高度 */
    height(node: TreeNode): number {
        // 空结点高度为 -1 ，叶结点高度为 0
        return node === null ? -1 : node.height;
    }

    /* 更新结点高度 */
    private updateHeight(node: TreeNode): void {
        // 结点高度等于最高子树高度 + 1
        node.height = Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* 获取平衡因子 */
    balanceFactor(node: TreeNode): number {
        // 空结点平衡因子为 0
        if (node === null) return 0;
        // 结点平衡因子 = 左子树高度 - 右子树高度
        return this.height(node.left) - this.height(node.right);
    }

    /* 右旋操作 */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // 以 child 为原点，将 node 向右旋转
        child.right = node;
        node.left = grandChild;
        // 更新结点高度
        this.updateHeight(node);
        this.updateHeight(child);
        // 返回旋转后子树的根结点
        return child;
    }

    /* 左旋操作 */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // 以 child 为原点，将 node 向左旋转
        child.left = node;
        node.right = grandChild;
        // 更新结点高度
        this.updateHeight(node);
        this.updateHeight(child);
        // 返回旋转后子树的根结点
        return child;
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    private rotate(node: TreeNode): TreeNode {
        // 获取结点 node 的平衡因子
        const balanceFactor = this.balanceFactor(node);
        // 左偏树
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右旋
                return this.rightRotate(node);
            } else {
                // 先左旋后右旋
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // 右偏树
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // 左旋
                return this.leftRotate(node);
            } else {
                // 先右旋后左旋
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // 平衡树，无需旋转，直接返回
        return node;
    }

    /* 插入结点 */
    insert(val: number): TreeNode {
        this.root = this.insertHelper(this.root, val);
        return this.root;
    }

    /* 递归插入结点（辅助方法） */
    private insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. 查找插入位置，并插入结点 */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // 重复结点不插入，直接返回
        }
        this.updateHeight(node); // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = this.rotate(node);
        // 返回子树的根结点
        return node;
    }

    /* 删除结点 */
    remove(val: number): TreeNode {
        this.root = this.removeHelper(this.root, val);
        return this.root;
    }

    /* 递归删除结点（辅助方法） */
    private removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. 查找结点，并删除之 */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子结点数量 = 0 ，直接删除 node 并返回
                if (child === null) {
                    return null;
                } else {
                    // 子结点数量 = 1 ，直接删除 node
                    node = child;
                }
            } else {
                // 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
                const temp = this.getInOrderNext(node.right);
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = this.rotate(node);
        // 返回子树的根结点
        return node;
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    private getInOrderNext(node: TreeNode): TreeNode {
        if (node === null) return node;
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while (node.left !== null) {
            node = node.left;
        }
        return node;
    }

    /* 查找结点 */
    search(val: number): TreeNode {
        let cur = this.root;
        // 循环查找，越过叶结点后跳出
        while (cur !== null) {
            if (cur.val < val) {
                // 目标结点在 cur 的右子树中
                cur = cur.right;
            } else if (cur.val > val) {
                // 目标结点在 cur 的左子树中
                cur = cur.left;
            } else {
                // 找到目标结点，跳出循环
                break;
            }
        }
        // 返回目标结点
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\n插入结点 ' + val + ' 后，AVL 树为');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\n删除结点 ' + val + ' 后，AVL 树为');
    printTree(tree.root);
}

/* Driver Code */
/* 初始化空 AVL 树 */
const avlTree = new AVLTree();
/* 插入结点 */
// 请关注插入结点后，AVL 树是如何保持平衡的
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

/* 插入重复结点 */
testInsert(avlTree, 7);

/* 删除结点 */
// 请关注删除结点后，AVL 树是如何保持平衡的
testRemove(avlTree, 8); // 删除度为 0 的结点
testRemove(avlTree, 5); // 删除度为 1 的结点
testRemove(avlTree, 4); // 删除度为 2 的结点

/* 查询结点 */
const node = avlTree.search(7);
console.log('\n查找到的结点对象为', node, '，结点值 = ' + node.val);
