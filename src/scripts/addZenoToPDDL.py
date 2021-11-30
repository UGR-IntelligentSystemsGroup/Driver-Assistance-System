#!/usr/bin/python3
# -*- coding: utf-8 -*-

import sys

###############################################################################
# Main
###############################################################################

# Arguments:
# Problem path
# Path to zeno primitives
# Driver name
def main(argv):
    PROBLEM_PATH = argv[1]
    ZENO_PATH = argv[2]
    DRIVER = argv[3]

    # -------------------------------------------------------------------------
    # Read data
    with open(ZENO_PATH, "r") as file:
        zeno_data = file.readlines()

    # First two lines are for the :objects section
    new_obj = "".join(zeno_data[0:2])
    zeno_data = "".join(zeno_data[2:])

    # Read problem file
    with open(PROBLEM_PATH, "r") as file:
        problem = file.read()

    # -------------------------------------------------------------------------
    # Replace driver name in zeno_data
    zeno_data = zeno_data.replace("driver1", DRIVER)

    # -------------------------------------------------------------------------
    # Append into :object
    obj_len = len(":objects")
    obj_index = problem.index(":objects")

    problem = problem[0:obj_index + obj_len] + "\n" + new_obj + problem[obj_index + obj_len:]
    
    # -------------------------------------------------------------------------
    # Append into :init
    init_len = len(":init")
    init_index = problem.index(":init")

    problem = problem[0:init_index + init_len] + zeno_data + problem[init_index + init_len:]

    # -------------------------------------------------------------------------
    # Write new problem file
    with open(PROBLEM_PATH, "w") as file:
        file.write(problem)

###############################################################################
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
###############################################################################

if __name__ == "__main__":
    main(sys.argv)