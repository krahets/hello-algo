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
        # 버킷 100개를 포함하는 배열을 초기화한다
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """해시 함수"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """조회 연산"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """추가 및 갱신 연산"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """삭제 연산"""
        index: int = self.hash_func(key)
        # None으로 설정하여 삭제를 나타낸다
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """모든 키-값 쌍 반환"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """모든 키 반환"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """모든 값 반환"""
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


"""실행 코드"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hmap = ArrayHashMap()

    # 추가 연산
    # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    hmap.put(12836, "小哈")
    hmap.put(15937, "小啰")
    hmap.put(16750, "小算")
    hmap.put(13276, "小法")
    hmap.put(10583, "小鸭")
    print("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    hmap.print()

    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    name = hmap.get(15937)
    print("\n학번 15937을 입력하여 조회한 이름 " + name)

    # 삭제 연산
    # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    hmap.remove(10583)
    print("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
    hmap.print()

    # 해시 테이블 순회
    print("\n키-값 쌍(키->값) 순회")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\n키 Key만 순회")
    for key in hmap.key_set():
        print(key)

    print("\n값 Value만 순회")
    for val in hmap.value_set():
        print(val)
