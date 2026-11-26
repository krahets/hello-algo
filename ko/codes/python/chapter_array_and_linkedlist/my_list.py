"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """리스트 클래스"""

    def __init__(self):
        """생성자"""
        self._capacity: int = 10  # 리스트 용량
        self._arr: list[int] = [0] * self._capacity  # 배열(리스트 원소 저장)
        self._size: int = 0  # 리스트 길이(현재 원소 수)
        self._extend_ratio: int = 2  # 리스트 용량을 늘릴 때마다 적용하는 배수

    def size(self) -> int:
        """리스트 길이(현재 원소 수) 구하기"""
        return self._size

    def capacity(self) -> int:
        """리스트 용량 구하기"""
        return self._capacity

    def get(self, index: int) -> int:
        """원소 접근"""
        # 인덱스가 범위를 벗어나면 예외를 던진다. 이하에서도 같다.
        if index < 0 or index >= self._size:
            raise IndexError("인덱스 범위 초과")
        return self._arr[index]

    def set(self, num: int, index: int):
        """원소 갱신"""
        if index < 0 or index >= self._size:
            raise IndexError("인덱스 범위 초과")
        self._arr[index] = num

    def add(self, num: int):
        """맨 뒤에 원소 추가"""
        # 원소 수가 용량을 초과하면 용량을 늘린다.
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """중간에 원소 삽입"""
        if index < 0 or index >= self._size:
            raise IndexError("인덱스 범위 초과")
        # 원소 수가 용량을 초과하면 용량을 늘린다.
        if self._size == self.capacity():
            self.extend_capacity()
        # 인덱스 index부터 끝까지 원소를 뒤로 한 칸씩 이동
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # 원소 수 갱신
        self._size += 1

    def remove(self, index: int) -> int:
        """원소 삭제"""
        if index < 0 or index >= self._size:
            raise IndexError("인덱스 범위 초과")
        num = self._arr[index]
        # 인덱스 index 다음의 원소를 모두 앞으로 한 칸씩 이동
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # 원소 수 갱신
        self._size -= 1
        # 삭제한 원소 반환
        return num

    def extend_capacity(self):
        """리스트 용량 늘리기"""
        # 원래 배열 길이의 _extend_ratio배인 새 배열을 만들고 원래 배열을 복사
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # 리스트 용량 갱신
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """유효한 길이만큼의 리스트 반환"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # 리스트 초기화
    nums = MyList()
    # 맨 뒤에 원소 추가
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"리스트 nums = {nums.to_array()}, 용량 = {nums.capacity()}, 길이 = {nums.size()}")

    # 중간에 원소 삽입
    nums.insert(6, index=3)
    print("인덱스 3에 숫자 6을 삽입한 후 nums =", nums.to_array())

    # 원소 삭제
    nums.remove(3)
    print("인덱스 3의 원소를 삭제한 후 nums =", nums.to_array())

    # 원소 접근
    num = nums.get(1)
    print("인덱스 1의 원소를 읽은 결과 num =", num)

    # 원소 갱신
    nums.set(0, 1)
    print("인덱스 1의 원소를 0으로 바꾼 후 nums =", nums.to_array())

    # 용량 확장 동작 테스트
    for i in range(10):
        # i = 5일 때 리스트 길이가 용량을 초과하게 되어 용량 확장이 일어난다.
        nums.add(i)
    print(f"용량 확장 후 리스트 {nums.to_array()}, 용량 = {nums.capacity()}, 길이 = {nums.size()}")
