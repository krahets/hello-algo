# 0-1 배낭 문제

배낭 문제는 동적 계획법 입문에 매우 좋은 예제이며 가장 흔한 문제 유형이다. 0-1 배낭, 무한 배낭, 개수 제한 배낭 등 여러 변형이 있다.

이 절에서는 가장 흔한 0-1 배낭 문제부터 해결한다.

!!! question "문제"

    물건 $n$ 개와 용량이 $cap$인 배낭이 주어진다. $i$ 번째 물건의 무게는 $wgt[i-1]$, 가치는 $val[i-1]$이다. 각 물건을 한 번만 선택할 수 있을 때, 배낭 용량 제한 안에 담을 수 있는 물건의 최대 가치를 구하라.

아래 그림에서 물건 번호 $i$는 $1$부터, 배열 인덱스는 $0$부터 시작하므로 물건 $i$의 무게와 가치는 각각 $wgt[i-1]$, $val[i-1]$이다.

![0-1 배낭 문제 예시 데이터](knapsack_problem.assets/knapsack_example.png)

0-1 배낭 문제는 $n$ 차례의 결정으로 이루어진 과정으로 볼 수 있다. 각 물건에는 넣지 않기와 넣기라는 두 결정이 있으므로 의사 결정 트리 모형을 만족한다.

목표가 '배낭 용량 제한 안에 담을 수 있는 최대 가치'이므로 동적 계획법 문제일 가능성이 높다.

**1단계: 매 차례의 결정을 생각하고 상태를 정의하여 $dp$ 테이블을 얻는다**

물건을 넣지 않으면 배낭 용량은 그대로이고, 넣으면 용량이 줄어든다. 따라서 현재 물건 번호 $i$와 배낭 용량 $c$로 상태를 정의하고 $[i, c]$라고 한다.

상태 $[i, c]$의 부분 문제는 **앞의 $i$ 개 물건을 용량 $c$인 배낭에 담았을 때의 최대 가치**이며, 이를 $dp[i, c]$라고 한다.

구할 값은 $dp[n, cap]$이므로 $(n+1) \times (cap+1)$ 크기의 2차원 $dp$ 테이블이 필요하다.

**2단계: 최적 부분 구조를 찾아 상태 전이 식을 도출한다**

물건 $i$에 대한 결정을 내리면 앞의 $i-1$ 개 물건을 결정하는 부분 문제가 남는다. 다음 두 경우로 나뉜다.

- **물건 $i$를 넣지 않음**: 용량은 그대로이며 상태는 $[i-1, c]$로 바뀐다.
- **물건 $i$를 넣음**: 용량이 $wgt[i-1]$ 줄고 가치가 $val[i-1]$ 늘며, 상태는 $[i-1, c-wgt[i-1]]$로 바뀐다.

이 분석에서 최적 부분 구조가 드러난다. **최대 가치 $dp[i, c]$는 물건 $i$를 넣지 않는 경우와 물건 $i$를 넣는 경우 중 가치가 더 큰 쪽이다**. 상태 전이 식은 다음과 같다.

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

현재 물건의 무게 $wgt[i - 1]$가 남은 용량 $c$를 넘으면 넣지 않는 선택만 가능하다.

**3단계: 경계 조건과 상태 전이 순서를 정한다**

물건이 없거나 배낭 용량이 $0$이면 최대 가치는 $0$이다. 즉, 첫 열 $dp[i, 0]$과 첫 행 $dp[0, c]$는 모두 $0$이다.

현재 상태 $[i, c]$는 바로 위의 $[i-1, c]$와 왼쪽 위의 $[i-1, c-wgt[i-1]]$에서 전이되므로, 이중 반복문으로 전체 $dp$ 테이블을 정방향으로 순회하면 된다.

이 분석을 바탕으로 완전 탐색, 메모이제이션을 이용한 탐색, 동적 계획법 순서로 구현한다.

### 방법 1: 완전 탐색

탐색 코드에는 다음 요소가 포함된다.

- **재귀 매개변수**: 상태 $[i, c]$.
- **반환값**: 부분 문제의 해 $dp[i, c]$.
- **종료 조건**: 물건 번호가 범위를 벗어나 $i = 0$이 되거나 남은 용량이 $0$이면 재귀를 종료하고 가치 $0$을 반환한다.
- **가지치기**: 현재 물건의 무게가 남은 배낭 용량보다 크면 넣지 않는 선택만 할 수 있다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs}
```

아래 그림과 같이 물건마다 선택하지 않기와 선택하기라는 두 탐색 가지가 생기므로 시간 복잡도는 $O(2^n)$이다.

재귀 트리에는 $dp[1, 10]$ 같은 중복 부분 문제가 있음을 쉽게 알 수 있다. 물건이 많고 용량이 크며, 특히 무게가 같은 물건이 많을수록 중복 부분 문제의 수가 크게 늘어난다.

![0-1 배낭 문제의 완전 탐색 재귀 트리](knapsack_problem.assets/knapsack_dfs.png)

### 방법 2: 메모이제이션을 이용한 탐색

중복 부분 문제를 한 번만 계산하도록 메모이제이션 리스트 `mem`에 부분 문제의 해를 저장한다. `mem[i][c]`는 $dp[i, c]$에 대응한다.

메모이제이션을 도입하면 **시간 복잡도는 부분 문제의 수에 의해 결정되므로** $O(n \times cap)$이다. 구현 코드는 다음과 같다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs_mem}
```

아래 그림은 메모이제이션을 이용한 탐색에서 잘라 낸 가지들을 보여 준다.

![0-1 배낭 문제의 메모이제이션 탐색 재귀 트리](knapsack_problem.assets/knapsack_dfs_mem.png)

### 방법 3: 동적 계획법

동적 계획법은 본질적으로 상태 전이를 통해 $dp$ 테이블을 채우는 과정이다. 코드는 다음과 같다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp}
```

아래 그림과 같이 시간 복잡도와 공간 복잡도는 모두 배열 `dp`의 크기인 $O(n \times cap)$이다.

=== "<1>"
    ![0-1 배낭 문제의 동적 계획법 과정](knapsack_problem.assets/knapsack_dp_step1.png)

=== "<2>"
    ![0-1 배낭 동적 계획법 2단계](knapsack_problem.assets/knapsack_dp_step2.png)

=== "<3>"
    ![0-1 배낭 동적 계획법 3단계](knapsack_problem.assets/knapsack_dp_step3.png)

=== "<4>"
    ![0-1 배낭 동적 계획법 4단계](knapsack_problem.assets/knapsack_dp_step4.png)

=== "<5>"
    ![0-1 배낭 동적 계획법 5단계](knapsack_problem.assets/knapsack_dp_step5.png)

=== "<6>"
    ![0-1 배낭 동적 계획법 6단계](knapsack_problem.assets/knapsack_dp_step6.png)

=== "<7>"
    ![0-1 배낭 동적 계획법 7단계](knapsack_problem.assets/knapsack_dp_step7.png)

=== "<8>"
    ![0-1 배낭 동적 계획법 8단계](knapsack_problem.assets/knapsack_dp_step8.png)

=== "<9>"
    ![0-1 배낭 동적 계획법 9단계](knapsack_problem.assets/knapsack_dp_step9.png)

=== "<10>"
    ![0-1 배낭 동적 계획법 10단계](knapsack_problem.assets/knapsack_dp_step10.png)

=== "<11>"
    ![0-1 배낭 동적 계획법 11단계](knapsack_problem.assets/knapsack_dp_step11.png)

=== "<12>"
    ![0-1 배낭 동적 계획법 12단계](knapsack_problem.assets/knapsack_dp_step12.png)

=== "<13>"
    ![0-1 배낭 동적 계획법 13단계](knapsack_problem.assets/knapsack_dp_step13.png)

=== "<14>"
    ![0-1 배낭 동적 계획법 14단계](knapsack_problem.assets/knapsack_dp_step14.png)

### 공간 최적화

각 상태는 바로 윗행의 상태에만 의존하므로 두 배열을 번갈아 갱신하면 공간 복잡도를 $O(n \times cap)$에서 $O(cap)$으로 줄일 수 있다.

배열 하나만으로도 가능할까? 각 상태는 바로 위 또는 왼쪽 위 칸에서 전이된다. 배열 하나를 쓴다면 $i$ 번째 행의 순회를 시작할 때 그 배열에는 아직 $i-1$ 번째 행의 상태가 저장되어 있다.

- 정방향으로 순회하면 $dp[i, j]$에 도달했을 때 왼쪽 위 $dp[i-1, 1]$ ~ $dp[i-1, j-1]$의 값이 이미 덮어써졌을 수 있어 올바른 상태 전이를 할 수 없다.
- 역방향으로 순회하면 값이 덮어써지는 문제가 없어 상태 전이를 올바르게 수행할 수 있다.

아래 그림은 배열 하나로 $i = 1$ 행에서 $i = 2$ 행으로 바꾸는 과정이다. 정방향과 역방향 순회의 차이를 생각해 보자.

=== "<1>"
    ![공간 최적화 후 0-1 배낭의 동적 계획법 과정](knapsack_problem.assets/knapsack_dp_comp_step1.png)

=== "<2>"
    ![공간 최적화된 0-1 배낭 2단계](knapsack_problem.assets/knapsack_dp_comp_step2.png)

=== "<3>"
    ![공간 최적화된 0-1 배낭 3단계](knapsack_problem.assets/knapsack_dp_comp_step3.png)

=== "<4>"
    ![공간 최적화된 0-1 배낭 4단계](knapsack_problem.assets/knapsack_dp_comp_step4.png)

=== "<5>"
    ![공간 최적화된 0-1 배낭 5단계](knapsack_problem.assets/knapsack_dp_comp_step5.png)

=== "<6>"
    ![공간 최적화된 0-1 배낭 6단계](knapsack_problem.assets/knapsack_dp_comp_step6.png)

구현에서는 배열 `dp`의 첫 번째 차원 $i$를 없애고 안쪽 반복문을 역방향 순회로 바꾸기만 하면 된다.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp_comp}
```
