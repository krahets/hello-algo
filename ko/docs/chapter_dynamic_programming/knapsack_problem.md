# 0-1 배낭 문제

배낭 문제는 동적 계획법을 익히기 좋은 입문 문제이며, 동적 계획법에서 가장 흔히 만나는 유형이다. 0-1 배낭, 무한 배낭, 개수 제한 배낭 등 다양한 변형이 있다.

이 절에서는 가장 일반적인 0-1 배낭 문제부터 풀어 보자.

!!! question

    물건 $n$개가 있고 $i$번째 물건의 무게는 $wgt[i-1]$, 가치는 $val[i-1]$이다. 배낭의 용량은 $cap$이다. 각 물건을 최대 한 번만 선택할 수 있을 때 배낭 용량 내에서 담을 수 있는 물건의 최대 총가치를 구하라.

아래 그림에서 물건 번호 $i$는 $1$부터, 배열 인덱스는 $0$부터 시작한다. 따라서 물건 $i$의 무게는 $wgt[i-1]$이고 가치는 $val[i-1]$이다.

![0-1 배낭의 예시 데이터](knapsack_problem.assets/knapsack_example.svg)

0-1 배낭 문제는 $n$번 결정하는 과정으로 볼 수 있다. 물건마다 넣지 않을지 넣을지 두 가지 선택이 있으므로 의사 결정 트리로 나타낼 수 있다.

목표가 ‘배낭 용량 내에서 담을 수 있는 물건의 최대 가치’를 구하는 것이므로 동적 계획법 문제일 가능성이 크다.

**첫 번째 단계: 매번 내릴 결정을 생각하고 상태를 정의해 $dp$ 테이블 구성하기**

각 물건을 배낭에 넣지 않으면 용량이 그대로이고, 넣으면 남은 용량이 줄어든다. 따라서 현재 물건 번호 $i$와 배낭 용량 $c$으로 상태를 정의해 $[i, c]$로 나타낸다.

상태 $[i, c]$에 해당하는 부분 문제는 **앞의 $i$개 물건으로 용량 $c$인 배낭에 담을 수 있는 최대 가치**를 구하는 것이다. 이를 $dp[i, c]$로 표기한다.

구하려는 값은 $dp[n, cap]$이므로 크기가 $(n+1) \times (cap+1)$인 2차원 $dp$ 테이블이 필요하다.

**두 번째 단계: 최적 부분 구조를 찾고 상태 전이식 유도하기**

물건 $i$에 대해 결정하면 앞의 $i-1$개 물건에 대해 결정하는 부분 문제가 남는다. 다음 두 경우로 나눌 수 있다.

- **물건 $i$를 넣지 않는 경우**: 배낭 용량은 그대로이고 상태는 $[i-1, c]$가 된다.
- **물건 $i$를 넣는 경우**: 배낭 용량은 $wgt[i-1]$만큼 줄고 가치는 $val[i-1]$만큼 늘며 상태는 $[i-1, c-wgt[i-1]]$가 된다.

이로부터 최적 부분 구조를 알 수 있다. **최대 가치 $dp[i, c]$는 물건 $i$를 넣지 않을 때의 가치와 물건 $i$를 넣을 때의 가치 중 더 큰 값이다**. 따라서 상태 전이식은 다음과 같다.

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

현재 물건의 무게 $wgt[i - 1]$이 남은 배낭 용량 $c$을 넘으면 넣지 않는 선택만 가능하다는 점에 주의하자.

**세 번째 단계: 경계 조건과 상태 전이 순서 정하기**

물건이 없거나 배낭 용량이 $0$이면 최대 가치는 $0$이다. 즉, 첫 열 $dp[i, 0]$와 첫 행 $dp[0, c]$의 값은 모두 $0$이다.

현재 상태 $[i, c]$는 위쪽 상태 $[i-1, c]$과 왼쪽 위 상태 $[i-1, c-wgt[i-1]]$에서 전이한다. 따라서 이중 반복문으로 $dp$ 테이블 전체를 정순으로 순회하면 된다.

이제 이 분석에 따라 완전 탐색, 메모이제이션 탐색, 동적 계획법 순으로 구현해 보자.

### 방법 1: 완전 탐색

탐색 코드에는 다음 요소가 들어간다.

- **재귀 호출의 매개변수**: 상태 $[i, c]$.
- **반환값**: 부분 문제의 해 $dp[i, c]$.
- **종료 조건**: 물건 번호가 범위를 벗어나 $i = 0$이거나 남은 배낭 용량이 $0$이면 재귀를 끝내고 가치 $0$을 반환한다.
- **가지치기**: 현재 물건의 무게가 남은 배낭 용량을 넘으면 물건을 넣지 않는 경우만 탐색한다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs}
```

아래 그림처럼 각 물건에서 선택하지 않는 분기와 선택하는 분기가 생기므로 시간 복잡도는 $O(2^n)$이다.

재귀 트리를 보면 $dp[1, 10]$처럼 중복되는 부분 문제를 쉽게 찾을 수 있다. 물건이 많고 배낭 용량이 클 때, 특히 무게가 같은 물건이 많을 때는 중복되는 부분 문제가 크게 늘어난다.

![0-1 배낭 문제의 완전 탐색 재귀 트리](knapsack_problem.assets/knapsack_dfs.svg)

### 방법 2: 메모이제이션 탐색

중복되는 부분 문제를 한 번만 계산하도록 메모 리스트 `mem`에 해를 저장한다. 여기서 `mem[i][c]`는 $dp[i, c]$에 대응한다.

메모이제이션을 도입하면 **시간 복잡도는 부분 문제 수에 의해 결정되며**, 그 결과 $O(n \times cap)$가 된다. 코드는 다음과 같다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs_mem}
```

아래 그림은 메모이제이션 탐색에서 가지치기한 탐색 분기를 보여 준다.

![0-1 배낭 문제의 메모이제이션 탐색 재귀 트리](knapsack_problem.assets/knapsack_dfs_mem.svg)

### 방법 3: 동적 계획법

동적 계획법은 결국 상태 전이에 따라 $dp$ 테이블을 채우는 과정이다. 코드는 다음과 같다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp}
```

아래 그림처럼 시간 복잡도와 공간 복잡도는 모두 배열 `dp`의 크기로 정해지며 $O(n \times cap)$이다.

=== "<1>"
    ![0-1 배낭 문제를 동적 계획법으로 푸는 과정](knapsack_problem.assets/knapsack_dp_step1.svg)

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.svg)

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.svg)

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.svg)

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.svg)

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.svg)

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.svg)

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.svg)

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.svg)

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.svg)

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.svg)

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.svg)

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.svg)

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.svg)

### 공간 최적화

각 상태는 바로 위 행의 상태에만 의존한다. 따라서 두 배열을 번갈아 쓰면 공간 복잡도를 $O(n \times cap)$에서 $O(cap)$로 줄일 수 있다.

한 걸음 더 나아가 배열 하나만 쓸 수 있을까? 각 상태는 바로 위 또는 왼쪽 위 칸에서 전이한다. 배열이 하나라면 $i$번째 행을 순회하기 시작할 때 그 배열에는 아직 $i-1$번째 행의 상태가 들어 있다.

- 정순으로 순회하면 $dp[i, j]$에 도달했을 때 왼쪽 위의 값 $dp[i-1, 1]$ ~ $dp[i-1, j-1]$가 이미 덮어쓰였을 수 있다. 그러면 상태 전이 결과가 틀릴 수 있다.
- 역순으로 순회하면 필요한 값을 미리 덮어쓰지 않으므로 상태 전이가 올바르게 이루어진다.

아래 그림은 배열 하나로 $i = 1$인 행에서 $i = 2$인 행으로 넘어가는 과정이다. 정순과 역순의 차이를 생각해 보자.

=== "<1>"
    ![공간을 최적화한 동적 계획법으로 0-1 배낭 문제를 푸는 과정](knapsack_problem.assets/knapsack_dp_comp_step1.svg)

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.svg)

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.svg)

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.svg)

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.svg)

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.svg)

코드에서는 배열 `dp`의 첫 번째 차원 $i$를 없애고 안쪽 반복문을 역순으로 바꾸면 된다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp_comp}
```
