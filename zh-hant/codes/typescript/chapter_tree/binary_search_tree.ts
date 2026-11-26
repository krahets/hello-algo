/**
 * File: binary_search_tree.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 二元搜尋樹 */
class BinarySearchTree {
    private root: TreeNode | null;

    /* 建構方法 */
    constructor() {
        // 初始化空樹
        this.root = null;
    }

    /* 取得二元樹的根節點 */
    getRoot(): TreeNode | null {
        return this.root;
    }

    /* 搜尋節點 */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur !== null) {
            // 目標節點在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 目標節點在 cur 的左子樹中
            else if (cur.val > num) cur = cur.left;
            // 找到目標節點，跳出迴圈
            else break;
        }
        // 回傳目標節點
        return cur;
    }

    /* 插入節點 */
    insert(num: number): void {
        // 若樹為空，則初始化根節點
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur !== null) {
            // 找到重複節點，直接返回
            if (cur.val === num) return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子樹中
            else cur = cur.left;
        }
        // 插入節點
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }

    /* 刪除節點 */
    remove(num: number): void {
        // 若樹為空，直接返回
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur !== null) {
            // 找到要刪除的節點，跳出迴圈
            if (cur.val === num) break;
            pre = cur;
            // 要刪除的節點在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 要刪除的節點在 cur 的左子樹中
            else cur = cur.left;
        }
        // 若找不到要刪除的節點，直接返回
        if (cur === null) return;
        // 子節點數為 0 或 1
        if (cur.left === null || cur.right === null) {
            // 有 0 個子節點時，child = null；只有 1 個時，child 指向該子節點
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // 刪除節點 cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 若刪除的是根節點，則重新指定根節點
                this.root = child;
            }
        }
        // 子節點數為 2
        else {
            // 取得中序走訪中 cur 的下一個節點
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // 以遞迴刪除節點 tmp
            this.remove(tmp!.val);
            // 用 tmp 的值覆寫 cur 的值
            cur.val = tmp!.val;
        }
    }
}

/* 主程式 */
/* 初始化二元搜尋樹 */
const bst = new BinarySearchTree();
// 請留意，插入順序不同，建成的二元樹也可能不同。這組序列會建成一棵完美二元樹
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\n初始化後的二元樹為\n');
printTree(bst.getRoot());

/* 搜尋節點 */
const node = bst.search(7);
console.log(
    '\n找到的節點物件為 ' + node + '，節點值 = ' + (node ? node.val : 'null')
);

/* 插入節點 */
bst.insert(16);
console.log('\n插入節點 16 後的二元樹為\n');
printTree(bst.getRoot());

/* 刪除節點 */
bst.remove(1);
console.log('\n刪除節點 1 後的二元樹為\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\n刪除節點 2 後的二元樹為\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\n刪除節點 4 後的二元樹為\n');
printTree(bst.getRoot());

export {};
