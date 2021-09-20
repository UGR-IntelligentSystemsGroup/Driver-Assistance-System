# FROM https://stackoverflow.com/questions/5180555/python-2-and-3-csv-reader
import csv342 as csv
#import csv

import io
# with io.open('some.csv', 'r', encoding='utf-8', newline='') as csv_file:
#     for row in csv.reader(csv_file, delimiter='|'):
#         print(row)


import os

os.chdir('c:\\users\\usuario\\documents\\investigacion\\umuai-v3\\planinteraction\\volcados')
os.chdir('G:\\Mi unidad\\Transferencia\\GantaBI\\Julio2018')


import sys
if sys.version_info[0] > 2:
    # py3k
    pass
else:
    # py2
    import codecs
    import warnings
    def open(file, mode='r', buffering=-1, encoding=None,
             errors=None, newline=None, closefd=True, opener=None):
        if newline is not None:
            warnings.warn('newline is not supported in py2')
        if not closefd:
            warnings.warn('closefd is not supported in py2')
        if opener is not None:
            warnings.warn('opener is not supported in py2')
        return codecs.open(filename=file, mode=mode, encoding=encoding,
                    errors=errors, buffering=buffering)


def duracionTominutes(duracion):
    #devuelve la duración en minutos de una cadena de tipo "HH:MM"
    return int(duracion.split(':')[0])*60 + int(duracion.split(':')[1])
    
def getDriverSymbol(currentDriver, previousDriver, driverCounter):
    #Dada la cadena currentDriver leida del fichero y la leida del anterior registro, y el contador actual de drivers
    #devuelve el mismo contador si no hay cambio de driver o lo incrementa en caso contrario
    if currentDriver != previousDriver:
        driverCounter+=1
    return "driver"+str(driverCounter), driverCounter
    
def setHHMM(hora):
    #ejemplo: convierte "3:45" en "03:45", e.d, garantiza que una hora este en formato HH:MM
    horas=hora.split(':')[0]
    if horas is None:
        horas='00'
    elif len(horas) < 2:
        horas = '0'+horas
    return horas+':'+hora.split(':')[1]

   
    




             
##             

# from https://stackoverflow.com/questions/31444177/encoding-a-csvreader

# def Latin1ToUnicodeDictReader(latin1_data, **kwargs):
#     csv_reader = csv.DictReader(latin1_data, **kwargs)
#     for row in csv_reader:
#         yield {key: value.decode('iso-8859-1').encode('utf8') if value else value for key, value in row.iteritems()}

#reader = Latin1ToUnicodeDictReader(csvfile, delimiter='\t')


##



def getSFromCSVFile(file='tacografo2.csv'):
    """ Devuelve una lista de strings COPECOCOPECCOO .... del fichero que pasemos en file"""

   
    with io.open(file, 'r', encoding="ISO-8859-1") as csv_file:
        tracereader = csv.DictReader(csv_file, delimiter=';')
        
        #csvfile = open('tacografo2.csv', 'r', encoding="ISO-8859-1")  #probar con encoding "utf-8" o "ISO-8859-1"
        #tracereader = csv.DictReader(csvfile, delimiter=';') 
        #tracereader = Latin1ToUnicodeDictReader(csvfile, delimiter=';')
        # cada fila es un diccionario con keys
    
        #odict_keys(['Conductor_Anonimizado', 'Dia', 'DMA', 'Hora_inicio', 'Hora_fin', 'Duracion[h]', 'Distancia[km]', 'Estado', 'Oficio', 'Vehiculo',      'Ubicacion_inicio', 'Ubicación_final', 'Latitud_inicio', 'Longitud_inicio', 'Latitud _inicio', 'Latitud _final', 'Iniciar_cuenta[km]', 'Finalizar_cuenta[km]'])
    
    
        #Asociar un estado con un prefix de simbolo de tarea
        symbolPrefix = dict([('Conduciendo', 'C'), ('Pausa', 'P'), ('En espera', 'E'),('Otro trabajo', 'O')])
        
        driverCounter = 0 #contador de drivers diferentes encontrados
        previousDriver="" #el driver anterior encontrado es vacío, porque estamos al inicio
    
        lista_strings = []
        row_index = 0 #contador de filas leidas -> es el índice de cada acción del estado inicial
        string_actual = ""
        for row in tracereader:
    
            currentDriver = row['Conductor_Anonimizado']
            driverSymbol, driverCounter = getDriverSymbol(currentDriver, previousDriver,driverCounter)
            estado = row['Estado']
            if (driverCounter > 1) and (currentDriver != previousDriver): 
                #hemos cambiado de conductor, añadimos el string_actual a la lista_strings y  tenemos un nuevo string_actual
                lista_strings.append(string_actual)
                print(string_actual)
                print(row_index)
                if row_index == 44119:
                    break
                string_actual = symbolPrefix[estado]
            else:
                string_actual += symbolPrefix[estado] #añado el prefix al string actual
            
            #FINAL:Incrementar row_index y actualizar previousDriver
            previousDriver = currentDriver
            row_index+=1
    #csvfile.close()
    return lista_strings
    

        

    
##
