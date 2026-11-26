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
    /* 建構方法 */
    constructor() {
        this.root = null; //根節點
    }

    /* 取得節點高度 */
    height(node: TreeNode): number {
        // 空節點的高度為 -1，葉節點的高度為 0
        return node === null ? -1 : node.height;
    }

    /* 更新節點高度 */
    private updateHeight(node: TreeNode): void {
        // 節點高度等於最高子樹的高度加 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* 取得平衡因子 */
    balanceFactor(node: TreeNode): number {
        // 空節點的平衡因子為 0
        if (node === null) return 0;
        // 節點的平衡因子 = 左子樹高度 - 右子樹高度
        return this.height(node.left) - this.height(node.right);
    }

    /* 右旋操作 */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // 以 child 為支點，將 node 向右旋轉
        child.right = node;
        node.left = grandChild;
        // 更新節點高度
        this.updateHeight(node);
        this.updateHeight(child);
        // 回傳旋轉後的子樹根節點
        return child;
    }

    /* 左旋操作 */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // 以 child 為支點，將 node 向左旋轉
        child.left = node;
        node.right = grandChild;
        // 更新節點高度
        this.updateHeight(node);
        this.updateHeight(child);
        // 回傳旋轉後的子樹根節點
        return child;
    }

    /* 透過旋轉讓這棵子樹恢復平衡 */
    private rotate(node: TreeNode): TreeNode {
        // 取得節點 node 的平衡因子
        const balanceFactor = this.balanceFactor(node);
        // 左偏樹
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右旋
                return this.rightRotate(node);
            } else {
                // 先左旋再右旋
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
                // 先右旋再左旋
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // 樹已平衡，無須旋轉，直接返回
        return node;
    }

    /* 插入節點 */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* 以遞迴插入節點（輔助方法） */
    private insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. 找出插入位置並插入節點 */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // 若節點重複，直接返回，略過插入操作
        }
        this.updateHeight(node); // 更新節點高度
        /* 2. 透過旋轉讓這棵子樹恢復平衡 */
        node = this.rotate(node);
        // 回傳子樹的根節點
        return node;
    }

    /* 刪除節點 */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* 以遞迴刪除節點（輔助方法） */
    private removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. 找出並刪除節點 */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 若有 0 個子節點，直接刪除 node 並返回
                if (child === null) {
                    return null;
                } else {
                    // 若只有 1 個子節點，直接刪除 node
                    node = child;
                }
            } else {
                // 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // 更新節點高度
        /* 2. 透過旋轉讓這棵子樹恢復平衡 */
        node = this.rotate(node);
        // 回傳子樹的根節點
        return node;
    }

    /* 搜尋節點 */
    search(val: number): TreeNode {
        let cur = this.root;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
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
        // 回傳目標節點
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\n插入節點 ' + val + ' 後的 AVL 樹為');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\n刪除節點 ' + val + ' 後的 AVL 樹為');
    printTree(tree.root);
}

/* 主程式 */
/* 初始化一棵空的 AVL 樹 */
const avlTree = new AVLTree();
/* 插入節點 */
// 請觀察插入節點後 AVL 樹如何維持平衡
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
// 請觀察刪除節點後 AVL 樹如何維持平衡
testRemove(avlTree, 8); // 刪除分支度為 0 的節點
testRemove(avlTree, 5); // 刪除分支度為 1 的節點
testRemove(avlTree, 4); // 刪除分支度為 2 的節點

/* 查詢節點 */
const node = avlTree.search(7);
console.log('\n找到的節點物件為', node, '，節點值 = ' + node.val);

export {};
