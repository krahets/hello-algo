# 최대 용량 문제

!!! question "문제"

    배열 $ht$의 각 원소는 수직 칸막이의 높이를 나타낸다. 배열에서 임의의 두 칸막이와 그 사이의 공간으로 용기를 만들 수 있다.
    
    용량은 높이와 너비의 곱(넓이)이다. 높이는 더 낮은 칸막이로 결정되고, 너비는 두 칸막이의 배열 인덱스 차이다.
    
    용량이 최대가 되도록 두 칸막이를 골라 최대 용량을 반환하라. 예시는 아래 그림과 같다.

![최대 용량 문제 예시 데이터](max_capacity_problem.assets/max_capacity_example.png)

임의의 두 칸막이로 용기를 만들므로 **이 문제의 상태는 두 칸막이의 인덱스 $[i, j]$다**.

문제에 따르면 용량은 높이와 너비의 곱이고, 높이는 낮은 칸막이로 결정되며 너비는 두 인덱스의 차다. 용량을 $cap[i, j]$라고 하면 다음 공식을 얻는다.

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

배열 길이가 $n$이면 두 칸막이의 조합 수(전체 상태 수)는 $C_n^2 = \frac{n(n - 1)}{2}$이다. 가장 직접적으로는 **모든 상태를 열거하여** 최대 용량을 구할 수 있으며, 시간 복잡도는 $O(n^2)$이다.

### 탐욕 전략 결정

더 효율적인 풀이도 있다. 아래 그림처럼 인덱스 $i < j$이고 높이 $ht[i] < ht[j]$인 상태 $[i, j]$를 고르자. 즉, $i$는 낮은 칸막이, $j$는 높은 칸막이다.

![초기 상태](max_capacity_problem.assets/max_capacity_initial_state.png)

아래 그림과 같이 **높은 칸막이 $j$를 낮은 칸막이 $i$ 쪽으로 옮기면 용량은 반드시 작아진다**.

$j$를 옮기면 너비 $j-i$는 확실히 줄어든다. 높이는 낮은 칸막이로 결정되므로 그대로이거나($i$가 계속 더 낮음), 더 낮아질 수만 있다(이동한 $j$가 더 낮아짐).

![높은 칸막이를 안쪽으로 옮긴 상태](max_capacity_problem.assets/max_capacity_moving_long_board.png)

반대로 생각하면 **낮은 칸막이 $i$를 안쪽으로 옮겨야만 용량이 커질 가능성이 있다**. 너비는 반드시 줄지만 **높이는 커질 수도 있기 때문이다**(이동한 $i$가 더 높을 수 있다). 아래 그림에서는 낮은 칸막이를 옮긴 뒤 넓이가 커진다.

![낮은 칸막이를 안쪽으로 옮긴 상태](max_capacity_problem.assets/max_capacity_moving_short_board.png)

따라서 두 포인터를 용기의 양 끝에 놓고, 매번 낮은 칸막이 쪽 포인터를 안쪽으로 옮겨 두 포인터가 만날 때까지 진행하는 탐욕 전략을 도출할 수 있다.

아래 그림은 탐욕 전략의 실행 과정이다.

1. 처음에는 포인터 $i$와 $j$를 배열의 양 끝에 둔다.
2. 현재 상태의 용량 $cap[i, j]$를 계산하고 최대 용량을 갱신한다.
3. 칸막이 $i$와 $j$의 높이를 비교하여 낮은 쪽을 안쪽으로 한 칸 옮긴다.
4. $i$와 $j$가 만날 때까지 `2.` 단계와 `3.` 단계를 반복한다.

=== "<1>"
    ![최대 용량 문제의 탐욕 과정](max_capacity_problem.assets/max_capacity_greedy_step1.png)

=== "<2>"
    ![최대 용량 탐욕 과정 2단계](max_capacity_problem.assets/max_capacity_greedy_step2.png)

=== "<3>"
    ![최대 용량 탐욕 과정 3단계](max_capacity_problem.assets/max_capacity_greedy_step3.png)

=== "<4>"
    ![최대 용량 탐욕 과정 4단계](max_capacity_problem.assets/max_capacity_greedy_step4.png)

=== "<5>"
    ![최대 용량 탐욕 과정 5단계](max_capacity_problem.assets/max_capacity_greedy_step5.png)

=== "<6>"
    ![최대 용량 탐욕 과정 6단계](max_capacity_problem.assets/max_capacity_greedy_step6.png)

=== "<7>"
    ![최대 용량 탐욕 과정 7단계](max_capacity_problem.assets/max_capacity_greedy_step7.png)

=== "<8>"
    ![최대 용량 탐욕 과정 8단계](max_capacity_problem.assets/max_capacity_greedy_step8.png)

=== "<9>"
    ![최대 용량 탐욕 과정 9단계](max_capacity_problem.assets/max_capacity_greedy_step9.png)

### 코드 구현

반복문은 최대 $n$ 회 실행되므로 **시간 복잡도는 $O(n)$이다**.

변수 $i$, $j$, $res$는 상수 크기의 추가 공간을 사용하므로 **공간 복잡도는 $O(1)$이다**.

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### 정확성 증명

탐욕 알고리즘이 모든 경우 열거보다 빠른 이유는 매번 일부 상태를 '건너뛰기' 때문이다.

예를 들어 상태 $cap[i, j]$에서 $i$가 낮은 칸막이, $j$가 높은 칸막이라고 하자. 낮은 $i$를 탐욕적으로 한 칸 안쪽으로 옮기면 아래 그림의 상태들을 건너뛴다. **이는 이후에 그 상태들의 용량을 확인할 수 없다는 뜻이다**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![낮은 칸막이를 옮겨 건너뛴 상태들](max_capacity_problem.assets/max_capacity_skipped_states.png)

**건너뛴 상태들은 사실 높은 칸막이 $j$를 안쪽으로 옮긴 모든 상태다**. 앞에서 높은 칸막이를 안쪽으로 옮기면 용량이 반드시 줄어듦을 보였다. 따라서 건너뛴 상태는 최적해가 될 수 없으며, **이를 건너뛰어도 최적해를 놓치지 않는다**.

이 분석은 낮은 칸막이를 옮기는 연산이 '안전'하며 탐욕 전략이 유효함을 보여 준다.
