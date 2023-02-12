"""
File: extract_code_zig.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))
from docs.utils.extract_code_java import ExtractCodeBlocksJava


class ExtractCodeBlocksZig(ExtractCodeBlocksJava):
    def __init__(self) -> None:
        super().__init__()
        
        self.ind = 4

        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)(pub|)\s*fn\s+(\w+)\(.+\)\s*(.+)\s*{\n'
        self.class_pattern = r'(\s*)(pub|)\s*(fn|const)\s+(\w+)\(*.+\)*\s*(type|struct)\s*{\n'
        
        self.func_pattern_keys = ["total", "ind", "scope", "label", "return"]
        self.class_pattern_keys = ["total", "ind", "scope", "type", "label", "struct"]

        # Pattern to match the start and end of a block
        self.block_start_pattern = '^\s*\n'
        self.block_start_shift = 1

    def extract_class_blocks(self):
        """
        Extract all the classes with given indentation
        """
        classes = {}
        class_pattern = re.compile(self.class_pattern)

        for line_num, line in enumerate(self.lines):
            # Search the class header
            class_match = class_pattern.match(line)
            if class_match is None:
                continue
            header_line = line_num

            # Search the block from the header line
            start_line, end_line, class_block = self.search_block(
                header_line, 0)
            # Construct the classes dict
            class_label = class_match.group(self.class_pattern_keys.index("label"))
            # Define the indentation by the class type
            class_type = class_match.group(self.class_pattern_keys.index("type"))
            self.ind = 8 if class_type == "fn" else 4
            classes[class_label] = {
                "indentation": 0,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": class_block,
                "funcs": self.extract_function_blocks(
                    indentation=self.ind, start_line=start_line, end_line=end_line)
            }

        return classes
        
    def post_process(self, classes, funcs):
        """
        Process the classes and functions
        """
        def remove_keyword(func):
            block = func["block"]
            header_line = func["line_number"]["header"] - \
                func["line_number"]["start"]
            block[header_line] = block[header_line].replace("pub ", "", 1)
        
        for clas in classes.values():
            remove_keyword(clas)
            for func in clas["funcs"].values():
                remove_keyword(func)
                if func["indentation"] == 8:
                    for i, line in enumerate(func["block"]):
                        func["block"][i] = line[4:]
        for func in funcs.values():
            remove_keyword(func)

# for code_path in glob.glob("codes/*/chapter_*/my_heap.zig"):
#     ext = ExtractCodeBlocksZig()
#     res = ext.extract(code_path)
#     pass