"""
File: extract_code_swift.py
Created Time: 2023-02-08
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))
from docs.utils.extract_code_java import ExtractCodeBlocksJava


class ExtractCodeBlocksSwift(ExtractCodeBlocksJava):
    def __init__(self) -> None:
        super().__init__()

        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)(public|private|)\s*(static|)\s*(func|)\s*(\w+)\(.*\).+{\s*\n'
        self.class_pattern = r'(public|)\s*class\s+(\w+)\s*\{'
        
        self.func_pattern_keys = ["total", "ind", "scope", "static", "func", "label"]
        self.class_pattern_keys = ["total", "scope", "label"]
