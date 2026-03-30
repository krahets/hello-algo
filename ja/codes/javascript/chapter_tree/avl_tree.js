/**
 * File: avl_tree.js
 * Created Time: 2023-02-05
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* AVL 木 */
class AVLTree {
    /* コンストラクタ */
    constructor() {
        this.root = null; // 根ノード
    }

    /* ノードの高さを取得 */
    height(node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node === null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    #updateHeight(node) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* 平衡係数を取得 */
    balanceFactor(node) {
        // 空ノードの平衡係数は 0
        if (node === null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return this.height(node.left) - this.height(node.right);
    }

    /* 右回転 */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // child を支点として node を右回転させる
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 左回転 */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // child を支点として node を左回転させる
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        this.#updateHeight(node);
        this.#updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 回転操作を行い、この部分木の平衡を回復する */
    #rotate(node) {
        // ノード node の平衡係数を取得
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
        // 平衡木なので回転不要、そのまま返す
        return node;
    }

    /* ノードを挿入 */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // 重複ノードは挿入せず、そのまま返す
        this.#updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = this.#rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを削除 */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. ノードを探索して削除 */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child === null) return null;
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else node = child;
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = this.#rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを探索 */
    search(val) {
        let cur = this.root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < val) cur = cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > val) cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else break;
        }
        // 目標ノードを返す
        return cur;
    }
}

function testInsert(tree, val) {
    tree.insert(val);
    console.log('\nノード ' + val + ' を挿入後，AVL 木は');
    printTree(tree.root);
}

function testRemove(tree, val) {
    tree.remove(val);
    console.log('\nノード ' + val + ' を削除後，AVL 木は');
    printTree(tree.root);
}

/* Driver Code */
/* 空の AVL 木を初期化する */
const avlTree = new AVLTree();
/* ノードを挿入 */
// ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
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

/* 重複ノードを挿入する */
testInsert(avlTree, 7);

/* ノードを削除 */
// ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
testRemove(avlTree, 8); // 次数 0 のノードを削除する
testRemove(avlTree, 5); // 次数 1 のノードを削除する
testRemove(avlTree, 4); // 次数 2 のノードを削除する

/* ノードを検索 */
const node = avlTree.search(7);
console.log('\n見つかったノードオブジェクトは', node, '，ノード値 = ' + node.val);
