"""
File: simple_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""


def add_hash(key: str) -> int:
    """Additive hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash += ord(c)
    return hash % modulus


def mul_hash(key: str) -> int:
    """Multiplicative hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = 31 * hash + ord(c)
    return hash % modulus


def xor_hash(key: str) -> int:
    """XOR hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash ^= ord(c)
    return hash % modulus


def rot_hash(key: str) -> int:
    """Rotating hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
    return hash % modulus


"""Driver code"""
if __name__ == "__main__":
    key = "Hello 算法"

    hash = add_hash(key)
    print(f"Additive hash value: {hash}")

    hash = mul_hash(key)
    print(f"Multiplicative hash value: {hash}")

    hash = xor_hash(key)
    print(f"XOR hash value: {hash}")

    hash = rot_hash(key)
    print(f"Rotating hash value: {hash}")
