# 이진 트리 순회

물리적 구조의 관점에서 트리는 연결 리스트 기반 자료 구조이므로, 포인터로 노드를 하나씩 방문하여 순회한다. 하지만 비선형 자료 구조여서 연결 리스트보다 순회가 복잡하며 탐색 알고리즘이 필요하다.

이진 트리의 주요 순회 방식은 레벨 순서 순회, 전위 순회, 중위 순회, 후위 순회 등이다.

## 레벨 순서 순회

아래 그림과 같이 <u>레벨 순서 순회(level-order traversal)</u>는 위에서 아래로 한 레벨씩 순회하며, 각 레벨에서는 왼쪽부터 오른쪽 순서로 노드를 방문한다.

레벨 순서 순회는 본질적으로 <u>너비 우선 순회(breadth-first traversal)</u>, 즉 <u>너비 우선 탐색(breadth-first search, BFS)</u>에 속한다. '한 겹씩 바깥으로 확장'하는 층별 순회 방식이다.

![이진 트리의 레벨 순서 순회](binary_tree_traversal.assets/binary_tree_bfs.png)

### 코드 구현

너비 우선 순회는 보통 '큐'로 구현한다. 큐는 '선입선출' 규칙을, 너비 우선 순회는 '한 레벨씩 진행'하는 규칙을 따르며, 바탕에 깔린 생각은 같다. 구현 코드는 다음과 같다.

```src
[file]{binary_tree_bfs}-[class]{}-[func]{level_order}
```

### 복잡도 분석

- **시간 복잡도 $O(n)$**: 모든 노드를 한 번씩 방문하므로 $O(n)$ 시간이 걸린다. $n$은 노드 수다.
- **공간 복잡도 $O(n)$**: 최악의 경우인 포화 이진 트리에서는 맨 아래 레벨을 순회하기 직전에 큐에 최대 $(n + 1) / 2$ 개 노드가 동시에 들어 있어 $O(n)$ 공간을 차지한다.

## 전위, 중위, 후위 순회

전위, 중위, 후위 순회는 모두 <u>깊이 우선 순회(depth-first traversal)</u>, 즉 <u>깊이 우선 탐색(depth-first search, DFS)</u>에 속한다. '먼저 끝까지 간 뒤 돌아와 계속하는' 순회 방식이다.

아래 그림은 이진 트리의 깊이 우선 순회 원리를 보여 준다. **깊이 우선 순회는 트리 전체의 바깥을 한 바퀴 '도는' 것과 같다**. 각 노드에서 세 위치를 만나며, 각각 전위, 중위, 후위 순회에 대응한다.

![이진 탐색 트리의 전위, 중위, 후위 순회](binary_tree_traversal.assets/binary_tree_dfs.png)

### 코드 구현

깊이 우선 탐색은 보통 재귀로 구현한다.

```src
[file]{binary_tree_dfs}-[class]{}-[func]{post_order}
```

!!! tip "참고"

    깊이 우선 탐색은 반복으로도 구현할 수 있다. 관심 있는 독자는 직접 알아보자.

아래 그림은 이진 트리 전위 순회의 재귀 과정을 보여 준다. 서로 반대 방향인 '호출'과 '반환'으로 나뉜다.

1. '호출'은 새 메서드를 시작하는 것으로, 프로그램은 이 과정에서 다음 노드를 방문한다.
2. '반환'은 함수가 돌아오는 것으로, 현재 노드의 방문이 끝났음을 뜻한다.

=== "<1>"
    ![전위 순회의 재귀 과정](binary_tree_traversal.assets/preorder_step1.png)

=== "<2>"
    ![전위 순회 2단계](binary_tree_traversal.assets/preorder_step2.png)

=== "<3>"
    ![전위 순회 3단계](binary_tree_traversal.assets/preorder_step3.png)

=== "<4>"
    ![전위 순회 4단계](binary_tree_traversal.assets/preorder_step4.png)

=== "<5>"
    ![전위 순회 5단계](binary_tree_traversal.assets/preorder_step5.png)

=== "<6>"
    ![전위 순회 6단계](binary_tree_traversal.assets/preorder_step6.png)

=== "<7>"
    ![전위 순회 7단계](binary_tree_traversal.assets/preorder_step7.png)

=== "<8>"
    ![전위 순회 8단계](binary_tree_traversal.assets/preorder_step8.png)

=== "<9>"
    ![전위 순회 9단계](binary_tree_traversal.assets/preorder_step9.png)

=== "<10>"
    ![전위 순회 10단계](binary_tree_traversal.assets/preorder_step10.png)

=== "<11>"
    ![전위 순회 11단계](binary_tree_traversal.assets/preorder_step11.png)

### 복잡도 분석

- **시간 복잡도 $O(n)$**: 모든 노드를 한 번씩 방문하므로 $O(n)$ 시간이 걸린다.
- **공간 복잡도 $O(n)$**: 최악의 경우 트리가 연결 리스트로 퇴화하면 재귀 깊이가 $n$에 이르러 시스템이 $O(n)$의 스택 프레임 공간을 사용한다.
