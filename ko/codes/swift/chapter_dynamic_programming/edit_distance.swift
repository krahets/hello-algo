/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 편집 거리: 완전 탐색 */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if i == 0, j == 0 {
        return 0
    }
    // s가 비어 있으면 t의 길이를 반환한다
    if i == 0 {
        return j
    }
    // t가 비어 있으면 s의 길이를 반환한다
    if j == 0 {
        return i
    }
    // 두 문자가 같으면 둘 다 건너뛴다
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 최소 편집 횟수 반환
    return min(min(insert, delete), replace) + 1
}

/* 편집 거리: 메모이제이션 탐색 */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if i == 0, j == 0 {
        return 0
    }
    // s가 비어 있으면 t의 길이를 반환한다
    if i == 0 {
        return j
    }
    // t가 비어 있으면 s의 길이를 반환한다
    if j == 0 {
        return i
    }
    // 기록이 있으면 바로 반환한다
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 두 문자가 같으면 둘 다 건너뛴다
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // 최소 편집 횟수를 기록하고 반환한다
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* 편집 거리: 동적 계획법 */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // 상태 전이: 첫 행과 첫 열
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // 상태 전이: 나머지 행과 열
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 두 문자가 같으면 둘 다 건너뛴다
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* 편집 거리: 공간 최적화 동적 계획법 */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // 상태 전이: 첫 행
    for j in 1 ... m {
        dp[j] = j
    }
    // 상태 전이: 나머지 행
    for i in 1 ... n {
        // 상태 전이: 첫 열
        var leftup = dp[0] // dp[i-1, j-1] 임시 저장
        dp[0] = i
        // 상태 전이: 나머지 열
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // 두 문자가 같으면 둘 다 건너뛴다
                dp[j] = leftup
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // 다음 반복에서 쓸 dp[i-1, j-1] 값으로 갱신한다
        }
    }
    return dp[m]
}

@main
enum EditDistance {
    /* 실행 예제 */
    static func main() {
        let s = "bag"
        let t = "pack"
        let n = s.utf8CString.count
        let m = t.utf8CString.count

        // 완전 탐색
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("문자열 \(s)에서 \(t)까지 최소 편집 횟수는 \(res)회")

        // 메모이제이션 탐색
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("문자열 \(s)에서 \(t)까지 최소 편집 횟수는 \(res)회")

        // 동적 계획법
        res = editDistanceDP(s: s, t: t)
        print("문자열 \(s)에서 \(t)까지 최소 편집 횟수는 \(res)회")

        // 공간 최적화 동적 계획법
        res = editDistanceDPComp(s: s, t: t)
        print("문자열 \(s)에서 \(t)까지 최소 편집 횟수는 \(res)회")
    }
}
