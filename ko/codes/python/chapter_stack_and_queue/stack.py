"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""실행 코드"""
if __name__ == "__main__":
    # 스택 초기화
    # Python에는 내장 스택 클래스가 없으므로 list를 스택으로 사용할 수 있다
    stack: list[int] = []

    # 스택에 원소 삽입
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("스택 stack =", stack)

    # 스택 맨 위 원소 접근
    peek: int = stack[-1]
    print("스택 맨 위 원소 peek =", peek)

    # 스택에서 원소 꺼내기
    pop: int = stack.pop()
    print("스택에서 꺼낸 원소 pop =", pop)
    print("스택에서 꺼낸 후 stack =", stack)

    # 스택의 길이 반환
    size: int = len(stack)
    print("스택의 길이 size =", size)

    # 비어 있는지 판단
    is_empty: bool = len(stack) == 0
    print("스택이 비어 있는가 =", is_empty)
