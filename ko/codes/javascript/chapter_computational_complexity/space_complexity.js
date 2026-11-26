/**
 * File: space_complexity.js
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

const { ListNode } = require('../modules/ListNode');
const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 함수 */
function constFunc() {
    // 어떤 연산을 수행한다
    return 0;
}

/* 상수 차수 */
function constant(n) {
    // 상수, 변수, 객체가 O(1)의 공간을 차지한다
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // 반복문 안의 변수가 O(1)의 공간을 차지한다
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // 반복문 안의 함수가 O(1)의 공간을 차지한다
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* 선형 차수 */
function linear(n) {
    // 길이 n인 배열이 O(n)의 공간을 차지한다
    const nums = new Array(n);
    // 길이 n인 리스트가 O(n)의 공간을 차지한다
    const nodes = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // 길이 n인 해시 테이블이 O(n)의 공간을 차지한다
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* 선형 차수(재귀 구현) */
function linearRecur(n) {
    console.log(`재귀 호출 n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* 이차 차수 */
function quadratic(n) {
    // 행렬이 O(n^2)의 공간을 차지한다
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // 2차원 리스트가 O(n^2)의 공간을 차지한다
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* 이차 차수(재귀 구현) */
function quadraticRecur(n) {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`재귀 호출 n = ${n}에서 nums의 길이 = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* 지수 차수(포화 이진 트리 생성) */
function buildTree(n) {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* 실행 예제 */
const n = 5;
// 상수 차수
constant(n);
// 선형 차수
linear(n);
linearRecur(n);
// 이차 차수
quadratic(n);
quadraticRecur(n);
// 지수 차수
const root = buildTree(n);
printTree(root);
