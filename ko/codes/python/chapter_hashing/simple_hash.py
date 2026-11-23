"""
File: simple_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""


def add_hash(key: str) -> int:
    """덧셈 해시"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash += ord(c)
    return hash % modulus


def mul_hash(key: str) -> int:
    """곱셈 해시"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = 31 * hash + ord(c)
    return hash % modulus


def xor_hash(key: str) -> int:
    """XOR 해시"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash ^= ord(c)
    return hash % modulus


def rot_hash(key: str) -> int:
    """회전 해시"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
    return hash % modulus


"""실행 코드"""
if __name__ == "__main__":
    key = "Hello 算法"

    hash = add_hash(key)
    print(f"덧셈 해시값은 {hash}이다")

    hash = mul_hash(key)
    print(f"곱셈 해시값은 {hash}이다")

    hash = xor_hash(key)
    print(f"XOR 해시값은 {hash}이다")

    hash = rot_hash(key)
    print(f"회전 해시값은 {hash}이다")
