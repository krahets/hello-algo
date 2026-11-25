/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 현재 상태가 해인지 확인한다 */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* 해를 기록한다 */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* 현재 상태에서 이 선택이 유효한지 확인한다 */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* 상태를 갱신한다 */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* 상태를 복원한다 */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* 백트래킹: 예제 3 */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
    }
    // 모든 선택지를 순회한다
    for (const choice of choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            // 다음 선택을 진행한다
            backtrack(state, [choice.left, choice.right], res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state);
        }
    }
}

// 실행 코드
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n이진 트리 초기화');
printTree(root);

// 백트래킹 알고리즘
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\n루트에서 값이 7인 노드까지 값이 3인 노드를 거치지 않는 모든 경로 출력');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
