/**
 * File: binary_search_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 二分探索木 */
class BinarySearchTree {
    /* コンストラクタ */
    constructor() {
        // 空の木を初期化する
        this.root = null;
    }

    /* 二分木の根ノードを取得する */
    getRoot() {
        return this.root;
    }

    /* ノードを探索する */
    search(num) {
        let cur = this.root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else break;
        }
        // 目的のノードを返す
        return cur;
    }

    /* ノードを挿入する */
    insert(num) {
        // 木が空の場合、根ノードを初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 重複したノードが見つかったので、そのまま戻る
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入する
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }

    /* ノードを削除する */
    remove(num) {
        // 木が空の場合、そのまま早期リターンする
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur.val === num) break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象のノードは cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur === null) return;
        // 子ノード数 = 0 または 1
        if (cur.left === null || cur.right === null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            const child = cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                this.root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除する
            this.remove(tmp.val);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
}

/* 実行用コード */
/* 二分探索木を初期化する */
const bst = new BinarySearchTree();
// 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\n初期化した二分木\n');
printTree(bst.getRoot());

/* ノードを探索する */
const node = bst.search(7);
console.log('\n見つかったノードオブジェクトは ' + node + '、ノードの値 = ' + node.val);

/* ノードを挿入する */
bst.insert(16);
console.log('\nノード 16 を挿入した後の二分木\n');
printTree(bst.getRoot());

/* ノードを削除する */
bst.remove(1);
console.log('\nノード 1 を削除した後の二分木\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nノード 2 を削除した後の二分木\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nノード 4 を削除した後の二分木\n');
printTree(bst.getRoot());
