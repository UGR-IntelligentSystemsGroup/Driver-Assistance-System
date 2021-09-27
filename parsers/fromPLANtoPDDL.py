#!/usr/bin/python3
# -*- coding: utf-8 -*-

import sys

###############################################################################
# Auxiliary functions
###############################################################################

def getPDDLActions(path):
    """Reads path (a PLAN file) and translates each line into a PDDL predicates"""
    actions = []
    drivers = set() # Set with the name of the drivers

    input = open(path, 'r')
    lines = input.readlines()   # lines es una row de strings

    # cada linea es de esta guisa => (0 C1 typeD "01/07/2018 00:00:00" "01/07/2018 01:59:00" 120 driver1)
    for line in lines:
        #quitar el paréntesis y otras cosas
        line = line.replace('(',"")
        line = line.replace(')',"")
        line = line.replace('\n',"")
        row  = line.split()

        # Add driver to set
        drivers.add(row[8])

        #convertir el string en row
        actionPddl = "\t\t(index_action " + row[1] + " " + row[0] + ")\n"
        actionPddl += "\t\t(is_action "   + row[1] + ")\n"
        actionPddl += "\t\t(is_"          + row[2] + " " + row[1] + ")\n"
        actionPddl += "\t\t(start_action " + row[1] + " " + row[3] + " " + row[4] + ")\n"
        actionPddl += "\t\t(end_action "   + row[1] + " " + row[5] + " " + row[6] + ")\n"
        actionPddl += "\t\t(duration_action " + row[1] + " " + row[7] + ")\n"
        actionPddl += "\t\t(parameters_"   + row[2] + " " + row[1] + " " + row[8] + ")\n\n"

        actions.append(actionPddl)

    input.close()

    return actions, drivers

###############################################################################
# PDDL constant output
###############################################################################

def getProblemHeader():
    return """(define (problem prueba0) (:domain GantaBi)
\t(:customization
\t\t(= :time-format "%d/%m/%Y %H:%M")
\t\t(= :time-horizon-relative 86400) ;; que son los minutos que tienen 2 meses
\t\t(= :time-start "01/01/2017 00:00:00")
\t\t(= :time-unit :minutes)
\t)
"""

# -----------------------------------------------------------------------------

def getProblemObjects(symbolFile, drivers):
    problemObjects = "\t(:objects\n\t\t"

    # -------------------------------------------------------------------------
    # Add drivers
    for d in drivers:
        problemObjects += d + " "

    problemObjects += "- Driver\n"

    # -------------------------------------------------------------------------
    # Add events symbols
    input = open(symbolFile, 'r')
    lines = input.readlines()   # lines es una row de strings

    for l in lines:
        problemObjects += "\n\t\t" + l + " - TaskInstanceSymbol"

    problemObjects += "\n\t)\n"

    input.close()


    return problemObjects

# -----------------------------------------------------------------------------

def getProblemInit(eventsFile):
    problemInit = """\t(:init
\t\t; Problem task: Recognize or Genererate
\t\t; (modo_generar)
\t\t(modo_reconocer)
\t\t(modo_depuracion)

\t\t; Initialize contexts
\t\t(token-context none)
\t\t(slice-context none)
\t\t(legal-slice-context none)
\t\t(daily-context none)
\t\t(weekly-context none)
\t\t(monthly-context none)

\t\t; Initialize functions
\t\t(= (minutos_consumidos) 0)
\t\t(= (contador_veces_AMPLIADA_en_semana) 0)

\t\t(= (current_rt) 0)
\t\t(= (dt_current_slice) 0)
\t\t(= (current_index_action) 0)

"""

    # Translate PLAN events into PDDL predicates
    eventsAsPddl, drivers = getPDDLActions(eventsFile)

    for d in drivers:
        problemInit += "\t\t; ------------{}-------------\n".format(d)
        problemInit += "\t\t(= (tiempo_conduccion {}) 0)\n".format(d)
        problemInit += "\t\t(= (tiempo_otros {}) 0)\n".format(d)
        problemInit += "\t\t(= (tiempo_parada {}) 0)\n".format(d)
        problemInit += "\t\t(= (tiempo_espera {}) 0)\n".format(d)

        problemInit += "\t\t(= (dt_day {}) 0)\n".format(d)
        problemInit += "\t\t(= (tiempo_otros_dia {}) 0)\n".format(d)
        problemInit += "\t\t(= (tiempo_parada_dia {}) 0)\n".format(d)
        problemInit += "\t\t(= (tiempo_espera_dia {}) 0)\n\n".format(d)

    problemInit += "\t\t; Events\n"

    for event in eventsAsPddl:
        problemInit += event

    problemInit += "\t)\n"

    return problemInit, drivers


# -----------------------------------------------------------------------------

def getProblemTask(drivers):
    problemFooter = """\t(:tasks-goal
\t\t:tasks (
\t\t\t(print_new_day)
"""
    for d in drivers:
        problemFooter += "\t\t\t(DD {})\n".format(d)

    problemFooter += "\t\t)\n\t)\n)"

    return problemFooter

###############################################################################
# Main
###############################################################################

def main(argv):
    # Assuming both .plan and .TaskSymbol have the same name
    eventsFile = argv[1]
    symbolFile = eventsFile.replace(".plan", ".TaskSymbol")
    outputFile = eventsFile.replace(".plan", ".pddl")

    # -------------------------------------------------------------------------
    # Get sections of a PDDL problem
    pddlHeader = getProblemHeader()
    pddlInit, drivers = getProblemInit(eventsFile)
    pddlObject = getProblemObjects(symbolFile, drivers)
    pddlTasks  = getProblemTask(drivers)

    # -------------------------------------------------------------------------
    # Write output
    output = open(outputFile, 'w')

    output.write(pddlHeader)
    output.write(pddlObject)
    output.write(pddlInit)
    output.write(pddlTasks)

    output.close()

###############################################################################
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
###############################################################################

if __name__ == "__main__":
    main(sys.argv)