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
        self.size = 0  # 키-값 쌍의 개수
        self.capacity = 4  # 해시 테이블의 용량
        self.load_thres = 2.0 / 3.0  # 용량을 늘리는 기준이 되는 적재율
        self.extend_ratio = 2  # 용량 증가 배수
        self.buckets = [[] for _ in range(self.capacity)]  # 버킷 배열

    def hash_func(self, key: int) -> int:
        """해시 함수"""
        return key % self.capacity

    def load_factor(self) -> float:
        """적재율"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """조회"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # key를 찾지 못하면 None 반환
        return None

    def put(self, key: int, val: str):
        """추가"""
        # 적재율이 임계값을 넘으면 용량 늘리기
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """삭제"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 버킷을 순회하며 해당 키-값 쌍 삭제
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """해시 테이블 용량 늘리기"""
        # 기존 해시 테이블 임시 보관
        buckets = self.buckets
        # 용량을 늘린 새 해시 테이블 초기화
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
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


"""Driver Code"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hashmap = HashMapChaining()

    # 추가
    # 해시 테이블에 키-값 쌍 (key, value) 추가
    hashmap.put(12836, "샤오하")
    hashmap.put(15937, "샤오뤄")
    hashmap.put(16750, "샤오쑤안")
    hashmap.put(13276, "샤오파")
    hashmap.put(10583, "샤오야")
    print("\n추가 후 해시 테이블\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # 조회
    # 해시 테이블에 키 key를 입력하여 값 value 조회
    name = hashmap.get(13276)
    print("\n학번 13276으로 조회한 이름: " + name)

    # 삭제
    # 해시 테이블에서 키-값 쌍 (key, value) 삭제
    hashmap.remove(12836)
    print("\n키 12836 삭제 후 해시 테이블\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
