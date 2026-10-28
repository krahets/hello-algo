"""
File: hash_map_chaining.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapChaining:
    """체이닝 해시 테이블"""

    def __init__(self):
        """생성자"""
        self.size = 0  # 키-값 쌍 개수
        self.capacity = 4  # 해시 테이블 용량
        self.load_thres = 2.0 / 3.0  # 용량 확장을 수행하는 적재율 임계값
        self.extend_ratio = 2  # 용량 확장 배수
        self.buckets = [[] for _ in range(self.capacity)]  # 버킷 배열

    def hash_func(self, key: int) -> int:
        """해시 함수"""
        return key % self.capacity

    def load_factor(self) -> float:
        """적재율"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """조회 연산"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # key를 찾지 못하면 None을 반환한다
        return None

    def put(self, key: int, val: str):
        """추가 연산"""
        # 적재율이 임계값을 초과하면 용량을 확장한다
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """삭제 연산"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 버킷을 순회하며 키-값 쌍을 삭제한다
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """해시 테이블 용량 확장"""
        # 원래 해시 테이블을 임시로 저장한다
        buckets = self.buckets
        # 용량을 확장한 새 해시 테이블을 초기화한다
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """해시 테이블 출력"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""실행 코드"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hashmap = HashMapChaining()

    # 추가 연산
    # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\n추가를 마친 후의 해시 테이블\n[키1 -> 값1, 키2 -> 값2, ...]")
    hashmap.print()

    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    name = hashmap.get(13276)
    print("\n학번 13276을 입력하여 조회한 이름 " + name)

    # 삭제 연산
    # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    hashmap.remove(12836)
    print("\n12836을 삭제한 후의 해시 테이블\n[키1 -> 값1, 키2 -> 값2, ...]")
    hashmap.print()
