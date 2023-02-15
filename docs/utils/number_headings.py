"""
File: number_headings.py
Created Time: 2023-02-16
Author: Krahets (krahets@163.com)
"""

import re

def get_heading_info_from_nav(mkdocs_path):
    """
    Get heading info from mkdocs navigation
    """
    
    with open(mkdocs_path) as f:
        lines = f.readlines()[125:]
    # Get nav lines
    for i, line in enumerate(lines):
        if "nav:" in line:
            break
    lines = lines[i:]

    # Search articles
    articles = []
    for line in lines:
        level = 0
        level_re = None
        while level_re is None and level < 3:
            level += 1
            level_pat = level * "  "
            level_pat = f"^{level_pat}- \d"
            level_re = re.search(level_pat, line)
        # Only add articles with heading level 2
        if level != 2:
            continue

        number_pat = level * "\d+."
        number_re = re.search(number_pat, line)
        number = re.search(number_pat, line).group(0) if number_re else None
        file_path = re.search("\S+\/\S+\.md", line).group(0)
        
        article = {
            "level": level,
            "number": number,
            "file_path": file_path
        }
        articles.append(article)
        
        print(f"{file_path}, heading number is {number}")

    return articles

def number_article(article, base_dir="build"):
    """
    Number a doc
    """
    
    with open(f"{base_dir}/{article['file_path']}", "r") as f:
        lines = f.readlines()

    # Add h1, h2 heading numbers
    h2_count = 1
    for i, line in enumerate(lines):
        h1_re = re.search("^(#)\s+\S+", line)
        if h1_re is not None:
            h1 = h1_re.group(1)
            lines[i] = line.replace(h1, f"# {article['number']}")
            continue

        h2_re = re.search("^(##)\s+\S+", line)
        if h2_re is not None:
            h2 = h2_re.group(1)
            lines[i] = line.replace(h2, f"## {article['number']}{h2_count}.")
            h2_count += 1

    with open(f"{base_dir}/{article['file_path']}", "w") as f:
        f.writelines(lines)


def number_headings(mkdocs_path, build_dir):
    """
    Build headings
    """
    
    articles = get_heading_info_from_nav(mkdocs_path)

    for article in articles:
        number_article(article, base_dir=build_dir)
