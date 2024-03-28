"""
File: simple_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""


def add_hash(key: str) -> int:
    """加法雜湊"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash += ord(c)
    return hash % modulus


def mul_hash(key: str) -> int:
    """乘法雜湊"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = 31 * hash + ord(c)
    return hash % modulus


def xor_hash(key: str) -> int:
    """互斥或雜湊"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash ^= ord(c)
    return hash % modulus


def rot_hash(key: str) -> int:
    """旋轉雜湊"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
    return hash % modulus


"""Driver Code"""
if __name__ == "__main__":
    key = "Hello 演算法"

    hash = add_hash(key)
    print(f"加法雜湊值為 {hash}")

    hash = mul_hash(key)
    print(f"乘法雜湊值為 {hash}")

    hash = xor_hash(key)
    print(f"互斥或雜湊值為 {hash}")

    hash = rot_hash(key)
    print(f"旋轉雜湊值為 {hash}")
