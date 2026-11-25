"""
File: hash_map_open_addressing.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapOpenAddressing:
    """개방 주소법 해시 테이블"""

    def __init__(self):
        """생성자"""
        self.size = 0  # 키-값 쌍의 개수
        self.capacity = 4  # 해시 테이블의 용량
        self.load_thres = 2.0 / 3.0  # 용량을 늘리는 기준이 되는 적재율
        self.extend_ratio = 2  # 용량 증가 배수
        self.buckets: list[Pair | None] = [None] * self.capacity  # 버킷 배열
        self.TOMBSTONE = Pair(-1, "-1")  # 삭제 표시

    def hash_func(self, key: int) -> int:
        """해시 함수"""
        return key % self.capacity

    def load_factor(self) -> float:
        """적재율"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """key에 해당하는 버킷 인덱스 찾기"""
        index = self.hash_func(key)
        first_tombstone = -1
        for _ in range(self.capacity):
            bucket = self.buckets[index]
            if bucket is None:
                break
            # 처음 만난 삭제 표시의 위치 기록
            if bucket is self.TOMBSTONE:
                if first_tombstone == -1:
                    first_tombstone = index
            # key를 만나면 해당 버킷 인덱스 반환
            elif bucket.key == key:
                # 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = bucket
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 옮긴 뒤의 버킷 인덱스 반환
                return index  # 버킷 인덱스 반환
            # 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % self.capacity
        # key가 없으면 삽입할 위치의 인덱스 반환
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """조회"""
        # key에 해당하는 버킷 인덱스 찾기
        index = self.find_bucket(key)
        # 키-값 쌍을 찾으면 해당 val 반환
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # 키-값 쌍이 없으면 None 반환
        return None

    def put(self, key: int, val: str):
        """추가"""
        # 적재율이 임계값을 넘으면 용량 늘리기
        if self.load_factor() > self.load_thres:
            self.extend()
        # key에 해당하는 버킷 인덱스 찾기
        index = self.find_bucket(key)
        # 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # 키-값 쌍이 없으면 새로 추가
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """삭제"""
        # key에 해당하는 버킷 인덱스 찾기
        index = self.find_bucket(key)
        # 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """해시 테이블 용량 늘리기"""
        # 기존 해시 테이블 임시 보관
        buckets_tmp = self.buckets
        # 용량을 늘린 새 해시 테이블 초기화
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """해시 테이블 출력"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hashmap = HashMapOpenAddressing()

    # 추가
    # 해시 테이블에 키-값 쌍 (key, val) 추가
    hashmap.put(12836, "샤오하")
    hashmap.put(15937, "샤오뤄")
    hashmap.put(16750, "샤오쑤안")
    hashmap.put(13276, "샤오파")
    hashmap.put(10583, "샤오야")
    print("\n추가 후 해시 테이블\nKey -> Value")
    hashmap.print()

    # 조회
    # 해시 테이블에 키 key를 입력하여 값 val 조회
    name = hashmap.get(13276)
    print("\n학번 13276으로 조회한 이름: " + name)

    # 삭제
    # 해시 테이블에서 키-값 쌍 (key, val) 삭제
    hashmap.remove(16750)
    print("\n키 16750 삭제 후 해시 테이블\nKey -> Value")
    hashmap.print()
