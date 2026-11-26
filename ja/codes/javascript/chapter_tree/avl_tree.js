/**
 * File: avl_tree.js
 * Created Time: 2023-02-05
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* AVL 木*/
class AVLTree {
    /* コンストラクタ */
    constructor() {
        this.root = null; //根ノード
    }

    /* ノードの高さを取得する */
    height(node) {
        // 空のノードの高さは -1、葉の高さは 0
        return node === null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    #updateHeight(node) {
        // ノードの高さは、左右の部分木の高さの最大値 + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* 平衡係数を取得する */
    balanceFactor(node) {
        // 空のノードの平衡係数は 0
        if (node === null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return this.height(node.left) - this.height(node.right);
    }

    /* 右回転 */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // child を軸に node を右回転する
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 回転後の部分木の根を返す
        return child;
    }

    /* 左回転 */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // child を軸に node を左回転する
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 回転後の部分木の根を返す
        return child;
    }

    /* 回転して部分木の平衡を回復する */
    #rotate(node) {
        // ノード node の平衡係数を取得する
        const balanceFactor = this.balanceFactor(node);
        // 左に偏った木
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // 右回転
                return this.#rightRotate(node);
            } else {
                // 左回転してから右回転
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // 左回転
                return this.#leftRotate(node);
            } else {
                // 右回転してから左回転
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // 平衡なので回転せずに戻る
        return node;
    }

    /* ノードを挿入する */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* 再帰によるノードの挿入（補助メソッド） */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. 挿入位置を探してノードを挿入する */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // 値が重複する場合は挿入せずに戻る
        this.#updateHeight(node); // ノードの高さを更新する
        /* 2. 回転して部分木の平衡を回復する */
        node = this.#rotate(node);
        // 部分木の根を返す
        return node;
    }

    /* ノードを削除する */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* 再帰によるノードの削除（補助メソッド） */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. ノードを探して削除する */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子が 0 個なら node を削除して戻る
                if (child === null) return null;
                // 子が 1 個なら node を削除する
                else node = child;
            } else {
                // 子が 2 個なら通りがけ順で次のノードを削除し、その値で現在のノードの値を置き換える
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // ノードの高さを更新する
        /* 2. 回転して部分木の平衡を回復する */
        node = this.#rotate(node);
        // 部分木の根を返す
        return node;
    }

    /* ノードを探索する */
    search(val) {
        let cur = this.root;
        // ループで探索し、葉を越えたら終了する
        while (cur !== null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < val) cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > val) cur = cur.left;
            // 目的のノードが見つかったのでループを抜ける
            else break;
        }
        // 目的のノードを返す
        return cur;
    }
}

function testInsert(tree, val) {
    tree.insert(val);
    console.log('\nノード ' + val + ' を挿入した後の AVL 木：');
    printTree(tree.root);
}

function testRemove(tree, val) {
    tree.remove(val);
    console.log('\nノード ' + val + ' を削除した後の AVL 木：');
    printTree(tree.root);
}

/* 実行例 */
/* 空の AVL 木を初期化する */
const avlTree = new AVLTree();
/* ノードを挿入する */
// 挿入後に AVL 木がどのように平衡を保つかに注目
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

/* 重複するノードを挿入する */
testInsert(avlTree, 7);

/* ノードを削除する */
// 削除後に AVL 木がどのように平衡を保つかに注目
testRemove(avlTree, 8); // 子が 0 個のノードを削除する
testRemove(avlTree, 5); // 子が 1 個のノードを削除する
testRemove(avlTree, 4); // 子が 2 個のノードを削除する

/* ノードを検索する */
const node = avlTree.search(7);
console.log('\n見つかったノードのオブジェクト：', node, '、ノードの値 = ' + node.val);
