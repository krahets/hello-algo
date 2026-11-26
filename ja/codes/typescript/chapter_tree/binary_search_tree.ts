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

    /* 二分木の根を取得する */
    getRoot(): TreeNode | null {
        return this.root;
    }

    /* ノードを探索する */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // ループで探索し、葉を越えたら終了する
        while (cur !== null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目的のノードが見つかったのでループを抜ける
            else break;
        }
        // 目的のノードを返す
        return cur;
    }

    /* ノードを挿入する */
    insert(num: number): void {
        // 木が空なら根を初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // ループで探索し、葉を越えたら終了する
        while (cur !== null) {
            // 値が重複するノードが見つかったらそのまま戻る
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入する
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }

    /* ノードを削除する */
    remove(num: number): void {
        // 木が空ならすぐに戻る
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // ループで探索し、葉を越えたら終了する
        while (cur !== null) {
            // 削除対象のノードが見つかったのでループを抜ける
            if (cur.val === num) break;
            pre = cur;
            // 削除対象は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象は cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象が見つからなければそのまま戻る
        if (cur === null) return;
        // 子が 0 個または 1 個
        if (cur.left === null || cur.right === null) {
            // 子が 0 個なら child = null、1 個なら child はその子
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 削除対象が根なら根を設定し直す
                this.root = child;
            }
        }
        // 子が 2 個
        else {
            // 通りがけ順で cur の次に来るノードを取得する
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // ノード tmp を再帰的に削除する
            this.remove(tmp!.val);
            // tmp の値で cur の値を上書きする
            cur.val = tmp!.val;
        }
    }
}

/* 実行例 */
/* 二分探索木を初期化する */
const bst = new BinarySearchTree();
// 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\n初期化した二分木：\n');
printTree(bst.getRoot());

/* ノードを探索する */
const node = bst.search(7);
console.log(
    '\n見つかったノードのオブジェクト： ' + node + '、ノードの値 = ' + (node ? node.val : 'null')
);

/* ノードを挿入する */
bst.insert(16);
console.log('\nノード 16 を挿入した後の二分木：\n');
printTree(bst.getRoot());

/* ノードを削除する */
bst.remove(1);
console.log('\nノード 1 を削除した後の二分木：\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nノード 2 を削除した後の二分木：\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nノード 4 を削除した後の二分木：\n');
printTree(bst.getRoot());

export {};
