"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """키-값 쌍"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """배열로 구현한 해시 테이블"""

    def __init__(self):
        """생성자"""
        # 버킷 100개로 배열 초기화
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """해시 함수"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """조회"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """추가 및 갱신"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """삭제"""
        index: int = self.hash_func(key)
        # None으로 설정하여 삭제를 나타냄
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """모든 키-값 쌍 가져오기"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """모든 키 가져오기"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """모든 값 가져오기"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """해시 테이블 출력"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hmap = ArrayHashMap()

    # 추가
    # 해시 테이블에 키-값 쌍 (key, value) 추가
    hmap.put(12836, "샤오하")
    hmap.put(15937, "샤오뤄")
    hmap.put(16750, "샤오쑤안")
    hmap.put(13276, "샤오파")
    hmap.put(10583, "샤오야")
    print("\n추가 후 해시 테이블\nKey -> Value")
    hmap.print()

    # 조회
    # 해시 테이블에 키 key를 입력하여 값 value 조회
    name = hmap.get(15937)
    print("\n학번 15937로 조회한 이름: " + name)

    # 삭제
    # 해시 테이블에서 키-값 쌍 (key, value) 삭제
    hmap.remove(10583)
    print("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
    hmap.print()

    # 해시 테이블 순회
    print("\n키-값 쌍 순회 Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\n키만 순회 Key")
    for key in hmap.key_set():
        print(key)

    print("\n값만 순회 Value")
    for val in hmap.value_set():
        print(val)
