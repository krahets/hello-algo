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
        self.size = 0  # 키-값 쌍 개수
        self.capacity = 4  # 해시 테이블 용량
        self.load_thres = 2.0 / 3.0  # 용량 확장을 수행하는 적재율 임계값
        self.extend_ratio = 2  # 용량 확장 배수
        self.buckets: list[Pair | None] = [None] * self.capacity  # 버킷 배열
        self.TOMBSTONE = Pair(-1, "-1")  # 삭제 표시

    def hash_func(self, key: int) -> int:
        """해시 함수"""
        return key % self.capacity

    def load_factor(self) -> float:
        """적재율"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """key에 해당하는 버킷 인덱스 탐색"""
        index = self.hash_func(key)
        first_tombstone = -1
        # 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
        while self.buckets[index] is not None:
            # key를 만나면 해당 버킷 인덱스를 반환한다
            if self.buckets[index].key == key:
                # 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 옮긴 후의 버킷 인덱스를 반환한다
                return index  # 버킷 인덱스를 반환한다
            # 처음 만난 삭제 표시를 기록한다
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
            index = (index + 1) % self.capacity
        # key가 없으면 추가할 위치의 인덱스를 반환한다
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """조회 연산"""
        # key에 해당하는 버킷 인덱스 탐색
        index = self.find_bucket(key)
        # 키-값 쌍을 찾으면 해당 val을 반환한다
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # 키-값 쌍이 없으면 None을 반환한다
        return None

    def put(self, key: int, val: str):
        """추가 연산"""
        # 적재율이 임계값을 초과하면 용량을 확장한다
        if self.load_factor() > self.load_thres:
            self.extend()
        # key에 해당하는 버킷 인덱스 탐색
        index = self.find_bucket(key)
        # 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """삭제 연산"""
        # key에 해당하는 버킷 인덱스 탐색
        index = self.find_bucket(key)
        # 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """해시 테이블 용량 확장"""
        # 원래 해시 테이블을 임시로 저장한다
        buckets_tmp = self.buckets
        # 용량을 확장한 새 해시 테이블을 초기화한다
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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


"""실행 코드"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hashmap = HashMapOpenAddressing()

    # 추가 연산
    # 해시 테이블에 키-값 쌍 (key, val)을 추가한다
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    hashmap.print()

    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 val을 얻는다
    name = hashmap.get(13276)
    print("\n학번 13276을 입력하여 조회한 이름 " + name)

    # 삭제 연산
    # 해시 테이블에서 키-값 쌍 (key, val)을 삭제한다
    hashmap.remove(16750)
    print("\n16750을 삭제한 후의 해시 테이블\n키 -> 값")
    hashmap.print()
