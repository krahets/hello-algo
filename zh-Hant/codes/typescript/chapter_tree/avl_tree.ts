/**
 * File: avl_tree.ts
 * Created Time: 2023-02-06
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* AVL 樹*/
class AVLTree {
    root: TreeNode;
    /* 建構子 */
    constructor() {
        this.root = null; //根節點
    }

    /* 獲取節點高度 */
    height(node: TreeNode): number {
        // 空節點高度為 -1 ，葉節點高度為 0
        return node === null ? -1 : node.height;
    }

    /* 更新節點高度 */
    private updateHeight(node: TreeNode): void {
        // 節點高度等於最高子樹高度 + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* 獲取平衡因子 */
    balanceFactor(node: TreeNode): number {
        // 空節點平衡因子為 0
        if (node === null) return 0;
        // 節點平衡因子 = 左子樹高度 - 右子樹高度
        return this.height(node.left) - this.height(node.right);
    }

    /* 右旋操作 */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // 以 child 為原點，將 node 向右旋轉
        child.right = node;
        node.left = grandChild;
        // 更新節點高度
        this.updateHeight(node);
        this.updateHeight(child);
        // 返回旋轉後子樹的根節點
        return child;
    }

    /* 左旋操作 */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // 以 child 為原點，將 node 向左旋轉
        child.left = node;
        node.right = grandChild;
        // 更新節點高度
        this.updateHeight(node);
        this.updateHeight(child);
        // 返回旋轉後子樹的根節點
        return child;
    }

    /* 執行旋轉操作，使該子樹重新恢復平衡 */
    private rotate(node: TreeNode): TreeNode {
        // 獲取節點 node 的平衡因子
        const balanceFactor = this.balanceFactor(node);
        // 左偏樹
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右旋
                return this.rightRotate(node);
            } else {
                // 先左旋後右旋
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // 右偏樹
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // 左旋
                return this.leftRotate(node);
            } else {
                // 先右旋後左旋
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // 平衡樹，無須旋轉，直接返回
        return node;
    }

    /* 插入節點 */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* 遞迴插入節點（輔助方法） */
    private insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. 查詢插入位置並插入節點 */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // 重複節點不插入，直接返回
        }
        this.updateHeight(node); // 更新節點高度
        /* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
        node = this.rotate(node);
        // 返回子樹的根節點
        return node;
    }

    /* 刪除節點 */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* 遞迴刪除節點（輔助方法） */
    private removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. 查詢節點並刪除 */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子節點數量 = 0 ，直接刪除 node 並返回
                if (child === null) {
                    return null;
                } else {
                    // 子節點數量 = 1 ，直接刪除 node
                    node = child;
                }
            } else {
                // 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // 更新節點高度
        /* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
        node = this.rotate(node);
        // 返回子樹的根節點
        return node;
    }

    /* 查詢節點 */
    search(val: number): TreeNode {
        let cur = this.root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            if (cur.val < val) {
                // 目標節點在 cur 的右子樹中
                cur = cur.right;
            } else if (cur.val > val) {
                // 目標節點在 cur 的左子樹中
                cur = cur.left;
            } else {
                // 找到目標節點，跳出迴圈
                break;
            }
        }
        // 返回目標節點
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\n插入節點 ' + val + ' 後，AVL 樹為');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\n刪除節點 ' + val + ' 後，AVL 樹為');
    printTree(tree.root);
}

/* Driver Code */
/* 初始化空 AVL 樹 */
const avlTree = new AVLTree();
/* 插入節點 */
// 請關注插入節點後，AVL 樹是如何保持平衡的
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

/* 插入重複節點 */
testInsert(avlTree, 7);

/* 刪除節點 */
// 請關注刪除節點後，AVL 樹是如何保持平衡的
testRemove(avlTree, 8); // 刪除度為 0 的節點
testRemove(avlTree, 5); // 刪除度為 1 的節點
testRemove(avlTree, 4); // 刪除度為 2 的節點

/* 查詢節點 */
const node = avlTree.search(7);
console.log('\n查詢到的節點物件為', node, '，節點值 = ' + node.val);

export {};
