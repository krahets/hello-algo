/**
 * File: edit_distance.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 최솟값 구하기 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 편집 거리: 완전 탐색 */
int editDistanceDFS(char *s, char *t, int i, int j) {    
    // s와 t가 모두 비어 있으면 0을 반환한다
    if (i == 0 && j == 0)
        return 0;
    // s가 비어 있으면 t의 길이를 반환한다
    if (i == 0)
        return j;
    // t가 비어 있으면 s의 길이를 반환한다
    if (j == 0)
        return i;
    // 두 문자가 같으면 두 문자를 바로 건너뛴다
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 최소 편집 횟수를 반환한다
    return myMin(myMin(insert, del), replace) + 1;
}

/* 편집 거리: 메모이제이션을 이용한 탐색 */
int editDistanceDFSMem(char *s, char *t, int memCols, int **mem, int i, int j) {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if (i == 0 && j == 0)
        return 0;
    // s가 비어 있으면 t의 길이를 반환한다
    if (i == 0)
        return j;
    // t가 비어 있으면 s의 길이를 반환한다
    if (j == 0)
        return i;
    // 기록이 이미 있으면 해당 값을 바로 반환한다
    if (mem[i][j] != -1)
        return mem[i][j];
    // 두 문자가 같으면 두 문자를 바로 건너뛴다
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    int insert = editDistanceDFSMem(s, t, memCols, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, memCols, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // 최소 편집 횟수를 기록하고 반환한다
    mem[i][j] = myMin(myMin(insert, del), replace) + 1;
    return mem[i][j];
}

/* 편집 거리: 동적 계획법 */
int editDistanceDP(char *s, char *t, int n, int m) {
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(m + 1, sizeof(int));
    }
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 상태 전이: 나머지 행과 열
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    int res = dp[n][m];
    // 메모리 해제
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 편집 거리: 공간을 최적화한 동적 계획법 */
int editDistanceDPComp(char *s, char *t, int n, int m) {
    int *dp = calloc(m + 1, sizeof(int));
    // 상태 전이: 첫 번째 행
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // 상태 전이: 나머지 행
    for (int i = 1; i <= n; i++) {
        // 상태 전이: 첫 번째 열
        int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
        dp[0] = i;
        // 상태 전이: 나머지 열
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[j] = leftup;
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
        }
    }
    int res = dp[m];
    // 메모리 해제
    free(dp);
    return res;
}

/* 실행 코드 */
int main() {
    char *s = "bag";
    char *t = "pack";
    int n = strlen(s), m = strlen(t);

    // 완전 탐색
    int res = editDistanceDFS(s, t, n, m);
    printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res);

    // 메모이제이션을 이용한 탐색
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((m + 1) * sizeof(int));
        memset(mem[i], -1, (m + 1) * sizeof(int));
    }
    res = editDistanceDFSMem(s, t, m + 1, mem, n, m);
    printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res);
    // 메모리 해제
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // 동적 계획법
    res = editDistanceDP(s, t, n, m);
    printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res);

    // 공간을 최적화한 동적 계획법
    res = editDistanceDPComp(s, t, n, m);
    printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res);

    return 0;
}
