#!/usr/bin/python3
# -*- coding: utf-8 -*-

import sys
import csv
from datetime import datetime, timedelta

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################

def durationToMinutes(duracion):
    """devuelve la duración en minutos de una cadena de tipo "HH:MM"""
    
    return int(duracion.split(':')[0]) * 60 + int(duracion.split(':')[1])


def getDriverSymbol(currentDriver, previousDriver, driverCounter):
    """Dada la cadena currentDriver leida del fichero y la leida del anterior registro, y el contador actual de drivers devuelve el mismo contador si no hay cambio de driver o lo incrementa en caso contrario"""
    
    if currentDriver != previousDriver:
        driverCounter += 1

    return "driver" + str(driverCounter), driverCounter


def setHHMM(hora):
    """ejemplo: convierte "3:45" en "03:45", e.d, garantiza que una hora este en formato HH:MM"""
    
    horas = hora.split(':')[0]

    if horas is None:
        horas = '00'
    elif len(horas) < 2:
        horas = '0' + horas

    return horas + ':' + hora.split(':')[1]


def dateWithDayZeroPadded(date):
    date = date.split('/')
    day = date[0]

    if len(day) < 2:
        day = '0' + day

    return day + "/" + date[1] + "/" + date[2]


def writeOutput(plan, previousDriverSymbol, diccionario_TaskInstanceSymbol):
    # Write plan (we could use previousDriver for the name too)
    output_plan = open(output_folder + 'event_log_{}.plan'.format(previousDriverSymbol), 'w')

    for p in plan:
        output_plan.write(p)

    output_plan.close()

    # Write symbols
    output_Symbols = open(output_folder + 'event_log_{}.TaskSymbol'.format(previousDriverSymbol), 'w')

    symbols = (' '.join(diccionario_TaskInstanceSymbol['D']) + '\n' +
                ' '.join(diccionario_TaskInstanceSymbol['O']) + '\n' +
                ' '.join(diccionario_TaskInstanceSymbol['B']) + '\n' +
                ' '.join(diccionario_TaskInstanceSymbol['I'])
            )
    output_Symbols.write(symbols)
    output_Symbols.close()

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################

# Dataset header
# Latitudes and longitudes could be wrong
# Driver,DateStart,HourStart,HourEnd,Duration,Distance,Status,Profession,Vehicle,PlaceStart,PlaceEnd,LatitudeStart,LongitudeStart,Latitud de inicio,Latitud final,MilometerStart,MilometerEnd

time_format_input = "%d/%m/%y %H:%M"
time_format_output = "%d/%m/%Y %H:%M"

output_folder = "./out/"

def main(argv):
    path = argv[1]

    # -------------------------------------------------------------------------

    # probar con encoding "utf-8" o "ISO-8859-1"
    with open(path, 'r', encoding="ISO-8859-1") as csvfile:

        # cada fila es un diccionario con keys
        tracereader = csv.DictReader(csvfile, delimiter=',')

        #Asociar un estado del csv con un tipo de tarea según los definidos en el dominio
        taskType = dict([('Conduciendo', 'typeD'), ('Pausa', 'typeB'),
                         ('En espera', 'typeI'), ('Otro trabajo', 'typeO')])
        
        #Asociar un estado con un prefix de simbolo de tarea
        symbolPrefix = dict([('Conduciendo', 'D'), ('Pausa', 'B'),
                             ('En espera', 'I'), ('Otro trabajo', 'O')])

        #Asociar un contador a cada prefijo de simbolo de tareas
        symbolCounter = dict([('D', 1), ('B', 1), ('I', 1), ('O', 1)])
        diccionario_TaskInstanceSymbol = {k: [] for k in ['D', 'O', 'B', 'I']}

        row_index = 0  # es el índice de cada acción del estado inicial
        driverCounter = 0  #contador de drivers diferentes encontrados
        previousDriver = ""  #el driver anterior encontrado es vacío, porque estamos al inicio
        
        plan = []   # Output plan for one driver
        for row in tracereader:
            # -----------------------------------------------------------------
            # Driver
            # -----------------------------------------------------------------
            currentDriver = row['Driver']
            driverSymbol, driverCounter = getDriverSymbol(currentDriver, previousDriver, driverCounter)

            # -----------------------------------------------------------------
            # Write output
            # -----------------------------------------------------------------

            # If new driver found, write previous plan
            if previousDriver != currentDriver and previousDriver != "":
                writeOutput(plan, previousDriverSymbol, diccionario_TaskInstanceSymbol)

                # Reset plan
                plan = []
                diccionario_TaskInstanceSymbol = {k: [] for k in ['D', 'O', 'B', 'I']}
                
                # NOTE: We could also reset the counters, but then we can't generate a unique problem
                # symbolCounter = dict([('D', 1), ('B', 1), ('I', 1), ('O', 1)])

            # -----------------------------------------------------------------
            # Status
            # -----------------------------------------------------------------
            estado = row['Status']
            prefix = symbolPrefix[estado]  # calculo el prefijo asociado al estado leido en row

            taskSymbol = prefix + str(symbolCounter[prefix])  #genero el simbolo de tarea

            diccionario_TaskInstanceSymbol[prefix].append(taskSymbol)

            symbolCounter[prefix] += 1  #incremento el contador de simbolos de esa tarea

            # -----------------------------------------------------------------
            # DateTime
            # -----------------------------------------------------------------
            date = row['DateStart']
            
            # Remove day name from date (it's in Spanish and it's not needed)
            date = date[4:]

            # Make day zero padded
            date = dateWithDayZeroPadded(date)

            hourStart = row['HourStart']
            hourEnd   = row['HourEnd']

            dateStart = datetime.strptime(date + " " + hourStart, time_format_input)
            dateEnd   = datetime.strptime(date + " " + hourEnd,   time_format_input)

            # Duration
            duration = row['Duration']
            duration = duration.replace("h", "")
            duration = duration.replace("m", "")
            duration = duration.split(" ")
            duration = timedelta(hours=int(duration[0]), minutes=int(duration[1]))

            # Check dateEnd equals (dateStart + duration)
            if not dateEnd == (dateStart + duration):
                print("Unexpected dateEnd. Probably spanning through midnight.")
                print("Date Start: ", dateStart)
                print("Date End: ", dateEnd)
                print("Duration: ", duration)

                dateEnd = dateStart + duration

                print("New Date End: ", dateEnd, "\n")

            # Duration to minutes (and string)
            duration = str(int(duration.total_seconds() // 60))

            # -----------------------------------------------------------------
            # Get plan row
            # -----------------------------------------------------------------

            # Write "(row_index taskSymbol taskType[estado] dateStart end duration driverSymbol)"
            string_output = ("(" + str(row_index) + " " + taskSymbol + " " 
                            + taskType[estado] + " \"" + dateStart.strftime(time_format_output) 
                            + "\" \"" + dateEnd.strftime(time_format_output) + "\" " 
                            + duration + " " + driverSymbol + ")\n")

            plan.append(string_output)

            # Increase row_index and update previousDriver
            row_index += 1
            previousDriver = currentDriver
            previousDriverSymbol = driverSymbol

        # If plan not empty -> Write last driver
        if plan:
            writeOutput(plan, previousDriverSymbol, diccionario_TaskInstanceSymbol)

###############################################################################
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
###############################################################################

if __name__ == "__main__":
    main(sys.argv)