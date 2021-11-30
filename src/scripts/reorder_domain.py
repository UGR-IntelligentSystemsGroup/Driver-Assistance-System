# reorder_domain.py
# Reorder methods in the HPDL domain for suggesting actions 
# based on driver preferences

# NOTE: CALL ONLY IF DRIVER PREFERS SPLIT

import re
import sys

DOMAIN_PATH = sys.argv[1]
OUTPUT_PATH = "hpdl/domain-zeno2.pddl"

with open(DOMAIN_PATH, encoding="utf8") as file:
    content = file.read()

# Get Uninterrupted method start-end positions
pattern_un = r';@#@-Uninterrupted.*?;#@#-Uninterrupted'
un_pos = re.search(pattern_un, content, re.DOTALL).span()

# Get Split method start-end positions
pattern_sp = r';@#@-Split.*?;#@#-Split'
sp_pos = re.search(pattern_sp, content, re.DOTALL).span()

# Interchange
out_content = (content[:un_pos[0]] +            # All text before uninterrupted
               content[sp_pos[0]:sp_pos[1]] +   # Split method
               content[un_pos[0]:un_pos[1]] +   # Uninterrupted method
               content[sp_pos[1]:])             # All text after split

with open(OUTPUT_PATH, 'w') as outfile:
    outfile.write(out_content)
