/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* 배열로 표현한 이진 트리 클래스 */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* 생성자 */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* 리스트 용량 */
    size(): number {
        return this.#tree.length;
    }

    /* 인덱스가 i인 노드의 값 반환 */
    val(i: number): number | null {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 나눗셈의 결과를 내림한다
    }

    /* 레벨 순서 순회 */
    levelOrder(): number[] {
        let res = [];
        // 배열을 직접 순회한다
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* 깊이 우선 순회 */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // 빈칸이면 반환한다
        if (this.val(i) === null) return;
        // 전위 순회
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // 중위 순회
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // 후위 순회
        if (order === 'post') res.push(this.val(i));
    }

    /* 전위 순회 */
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* 중위 순회 */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* 후위 순회 */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* 실행 코드 */
// 이진 트리 초기화
// 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
const arr = Array.of(
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
);

const root = arrToTree(arr);
console.log('\n이진 트리 초기화\n');
console.log('이진 트리의 배열 표현:');
console.log(arr);
console.log('이진 트리의 연결 리스트 표현:');
printTree(root);

// 배열로 표현한 이진 트리 클래스
const abt = new ArrayBinaryTree(arr);

// 노드 접근
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\n현재 노드의 인덱스: ' + i + ' , 값: ' + abt.val(i));
console.log(
    '왼쪽 자식 노드의 인덱스: ' + l + ' , 값: ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    '오른쪽 자식 노드의 인덱스: ' + r + ' , 값: ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    '부모 노드의 인덱스: ' + p + ' , 값: ' + (p === null ? 'null' : abt.val(p))
);

// 트리 순회
let res = abt.levelOrder();
console.log('\n레벨 순서 순회:' + res);
res = abt.preOrder();
console.log('전위 순회:' + res);
res = abt.inOrder();
console.log('중위 순회:' + res);
res = abt.postOrder();
console.log('후위 순회:' + res);

export {};
