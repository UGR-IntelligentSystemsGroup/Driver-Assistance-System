#!/usr/bin/python

import sys
import os

print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)


os.chdir('/home/juan/Investigacion/GantaBI')

currdir = os.getcwd()
salidabruta=sys.argv[1]
salidapddl=sys.argv[2]

##

#salidabruta = 'sequence1.plan'
salidabruta = 'sequence_02563606A.plan'
salidapddl = 'sequence2.pddl'

inputfile = currdir +'/'+ salidabruta #Ej1plan1.salida'
outputfile = currdir + '/' + salidapddl #Ej1plan1.pddl'
input = open(inputfile, 'r')
output =open(outputfile, 'w')
lines = input.readlines()# lines es una lista de strings


# cada linea es de esta guisa => (0 C1 typeD "01/07/2018 00:00:00" "01/07/2018 01:59:00" 120 driver1)
for line in lines:
    #quitar el paréntesis y otras cosas
    line = line.translate(None,'(')
    line = line.translate(None, ')')
    line = line.translate(None,'\n')
    lista = line.split()
    #convertir el string en lista
    accionpddl = ""
    accionpddl +=  "(index_action "+ lista[1]+ " "+lista[0]+")\n" 
    accionpddl +=  "(is_action "+lista[1]+")\n" 
    accionpddl +=  "(is_"+lista[2]+" "+lista[1]+")\n"   
    accionpddl += "(start_action "+lista[1]+" "+lista[3]+" "+lista[4]+")\n"  
    accionpddl += "(end_action "+lista[1]+" "+lista[5]+" "+lista[6]+")\n" 
    accionpddl += "(duration_action "+lista[1]+" "+lista[7]+")\n" 
    accionpddl += "(parameters_"+lista[2]+" "+lista[1]+" "+lista[8]+")\n" 
    output.write(accionpddl)
    output.write("\n")
    
output.close()
input.close()
    


        
##