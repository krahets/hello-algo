/**
 * File: binary_search_tree.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 二分探索木 */
class BinarySearchTree {
    private root: TreeNode | null;

    /* コンストラクタ */
    constructor() {
        // 空の木を初期化する
        this.root = null;
    }

    /* 二分木の根ノードを取得 */
    getRoot(): TreeNode | null {
        return this.root;
    }

    /* ノードを探索 */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else break;
        }
        // 目標ノードを返す
        return cur;
    }

    /* ノードを挿入 */
    insert(num: number): void {
        // 木が空なら、根ノードを初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }

    /* ノードを削除 */
    remove(num: number): void {
        // 木が空なら、そのまま早期リターンする
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur.val === num) break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象ノードは cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur === null) return;
        // 子ノード数 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                this.root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // ノード tmp を再帰的に削除
            this.remove(tmp!.val);
            // tmp で cur を上書きする
            cur.val = tmp!.val;
        }
    }
}

/* Driver Code */
/* 二分探索木を初期化 */
const bst = new BinarySearchTree();
// 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\n初期化された二分木は\n');
printTree(bst.getRoot());

/* ノードを探索 */
const node = bst.search(7);
console.log(
    '\n見つかったノードオブジェクトは ' + node + '、ノードの値 = ' + (node ? node.val : 'null')
);

/* ノードを挿入 */
bst.insert(16);
console.log('\nノード 16 を挿入した後、二分木は\n');
printTree(bst.getRoot());

/* ノードを削除 */
bst.remove(1);
console.log('\nノード 1 を削除した後、二分木は\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nノード 2 を削除した後、二分木は\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nノード 4 を削除した後、二分木は\n');
printTree(bst.getRoot());

export {};
