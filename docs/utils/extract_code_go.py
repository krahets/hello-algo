"""
File: extract_code_go.py
Created Time: 2023-02-07
Author: Krahets (krahets@163.com)
"""

import re
import glob
import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))
from docs.utils.extract_code_java import ExtractCodeBlocksJava


class ExtractCodeBlocksGo(ExtractCodeBlocksJava):
    def __init__(self) -> None:
        super().__init__()

        # Pattern to match function names and class names
        self.func_pattern = r'(\s*)func\s+(\(.+\))*\s*(\w+)\((.*)\)\s*(\S*)\s*{\n'
        self.class_pattern = r'(\s*)type\s+(\w+)'
        
        self.func_pattern_keys = ["total", "ind", "class", "label", "params", "return"]
        self.class_pattern_keys = ["total", "ind", "label"]

    def extract(self, file_path):
        """
        Extract classes and functions from a markdown document
        """
        if not osp.isfile(file_path):
            return None
        
        self.file_path = file_path
        with open(file_path) as f:
            self.lines = f.readlines()
            self.content = "".join(self.lines)

        # Detect and extract all the classes and fucntions
        classes = self.extract_class_blocks()
        funcs = self.extract_function_blocks(classes=classes)

        self.post_process(classes, funcs)

        return {
            "classes": classes,
            "funcs": funcs,
        }

    def extract_function_blocks(self, classes=None, class_label="", indentation=0):
        """
        Extract all the functions with given indentation
        """
        
        funcs = {}
        func_pattern = re.compile(self.func_pattern)

        for line_num in range(len(self.lines)):
            # Search the function header
            func_match = func_pattern.match(self.lines[line_num])
            if func_match is None:
                continue
            header_line = line_num
            
            func_label = func_match.group(self.func_pattern_keys.index("label"))
            func_cls_label = func_match.group(self.func_pattern_keys.index("class"))
            func_return = func_match.group(self.func_pattern_keys.index("return"))
            
            def check_func_blong_to_class(label):
                class_label_pattern = re.compile(f".*\*{label}\).*")
                func_return_pattern = re.compile(f".*{label}.*")
                constructor_pattern = re.compile(f".*new.*")
                
                class_label_match = class_label_pattern.match(f"{func_cls_label}")
                func_return_match = func_return_pattern.match(f"{func_return}")
                constructor_match = constructor_pattern.match(func_label)
                
                return class_label_match, func_return_match, constructor_match
            
            if classes:
                # The function should not blong to any class
                flag = False
                for label in classes:
                    # Match the target class label
                    class_label_match, func_return_match, constructor_match = \
                        check_func_blong_to_class(label)

                    if class_label_match is not None or \
                       func_return_match is not None and constructor_match is not None:
                        flag = True                    
                if flag:
                    continue

            elif class_label:
                # Match the target class label
                class_label_match, func_return_match, constructor_match = \
                    check_func_blong_to_class(class_label)
                
                if class_label_match is None and func_return_match is None or \
                   func_return_match is not None and constructor_match is None:
                    continue

            # Search the block from the header line
            start_line, end_line, func_block = self.search_block(
                header_line, indentation)
            # Construct the funcs dict
            funcs[func_label] = {
                "indentation": indentation,
                "line_number": {
                    "start": start_line,
                    "end": end_line,
                    "header": header_line,
                },
                "block": func_block,
            }

        return funcs
    
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
            _, _, class_block = self.search_block(
                header_line, 0)
            # Construct the classes dict
            class_label = class_match.group(self.class_pattern_keys.index("label"))
            funcs = self.extract_function_blocks(class_label=class_label)
            # Merge function blocks to class_block
            for func in funcs.values():
                class_block.append('\n')
                class_block += func["block"]
            
            classes[class_label] = {
                "indentation": 0,
                "line_number": {
                    "header": header_line,
                },
                "block": class_block,
                "funcs": funcs,
            }
            
        return classes

    def post_process(self, classes, funcs):
        """
        Process the classes and functions
        """
        def replace_tabs(x):
            for i, line in enumerate(x["block"]):
                x["block"][i] = line.replace("\t"," " * self.ind)
                
        def add_inds(x):
            for i, line in enumerate(x["block"]):
                if line != "\n":
                    x["block"][i] = " " * self.ind + line
        
        for clas in classes.values():
            replace_tabs(clas)
            for func in clas["funcs"].values():
                replace_tabs(func)
                add_inds(func)
        for func in funcs.values():
            replace_tabs(func)


for code_path in glob.glob("codes/*/chapter_*/graph_adjacency_matrix.go"):
    ext = ExtractCodeBlocksGo()
    res = ext.extract(code_path)
    pass
