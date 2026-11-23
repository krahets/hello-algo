/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 현재 상태가 해인지 판단 */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* 해를 기록한다 */
function recordSolution(state, res) {
    res.push([...state]);
}

/* 현재 상태에서 해당 선택이 유효한지 판단 */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* 상태 갱신 */
function makeChoice(state, choice) {
    state.push(choice);
}

/* 상태 복원 */
function undoChoice(state) {
    state.pop();
}

/* 백트래킹 알고리즘: 예제 3 */
function backtrack(state, choices, res) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
    }
    // 모든 선택지를 순회한다
    for (const choice of choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            // 다음 선택을 진행한다
            backtrack(state, [choice.left, choice.right], res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            undoChoice(state);
        }
    }
}

// 실행 코드
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화');
printTree(root);

// 백트래킹 알고리즘
const res = [];
backtrack([], [root], res);

console.log('\n값이 3인 노드를 포함하지 않는 조건으로, 루트 노드에서 노드 7까지의 모든 경로 출력');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
