"""
File: extract_code_python.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))
from docs.utils.extract_code_java import ExtractCodeBlocksJava


class ExtractCodeBlocksPython(ExtractCodeBlocksJava):
    def __init__(self) -> None:
        super().__init__()
        
        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)def\s+(\w+)\s*\('
        self.class_pattern = r'class\s+(\w+)'
        
        self.func_pattern_keys = ["total", "ind", "label"]
        self.class_pattern_keys = ["total", "label"]
        
        # Pattern to match the start and end of a block
        self.block_end_pattern = '^\s{0,ind}\S+.*\n'
        self.block_start_pattern = '^\s{ind}""".+'
        self.block_start_shift = 0
        self.block_end_shift = -1

    def post_process(self, classes, funcs):
        """
        Process the classes and functions
        """
        def remove_empty_lines(func):
            start_line, end_line = func["line_number"]["start"], func["line_number"]["end"]
            block = func["block"]
            # Remove empty lines at bottom
            for i in range(len(block) - 1, -1, -1):
                if re.search("^\s*\n", block[i]) is None:
                    break
                end_line -= 1
            func["line_number"]["end"] = end_line
            func["block"] = block[:end_line - start_line + 1]

        for clas in classes.values():
            remove_empty_lines(clas)
            for func in clas["funcs"].values():
                remove_empty_lines(func)
        for func in funcs.values():
            remove_empty_lines(func)
