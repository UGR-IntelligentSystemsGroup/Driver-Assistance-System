import csv
import os

os.chdir('c:\\users\\usuario\\documents\\investigacion\\umuai-v3\\planinteraction\\volcados')
os.chdir('G:\\Mi unidad\\Transferencia\\GantaBI\\Julio2018')


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
with open('tacografo2.csv', 'r', encoding="ISO-8859-1") as csvfile:  #probar con encoding "utf-8" o "ISO-8859-1"
    tracereader = csv.DictReader(csvfile, delimiter=';') 
    # cada fila es un diccionario con keys
    
#odict_keys(['Conductor_Anonimizado', 'Dia', 'DMA', 'Hora_inicio', 'Hora_fin', 'Duracion[h]', 'Distancia[km]', 'Estado', 'Oficio', 'Vehiculo', 'Ubicacion_inicio', 'Ubicación_final', 'Latitud_inicio', 'Longitud_inicio', 'Latitud _inicio', 'Latitud _final', 'Iniciar_cuenta[km]', 'Finalizar_cuenta[km]'])

    #Asociar un estado del csv con un tipo de tarea según los definidos en el dominio
    taskType = dict([('Conduciendo', 'typeD'), ('Pausa', 'typeB'), ('En espera', 'typeI'),('Otro trabajo', 'typeO')])
    #Asociar un estado con un prefix de simbolo de tarea
    symbolPrefix = dict([('Conduciendo', 'D'), ('Pausa', 'B'), ('En espera', 'I'),('Otro trabajo', 'O')])
    #Asociar un contador a cada prefijo de simbolo de tareas
    symbolCounter =  dict([('C', 1), ('P', 1), ('E', 1),('O', 1)])
   
    
    diccionario_TaskInstanceSymbol = {k: [] for k in ['C','O','P','E']}
   
    
    
    row_index = 0 #contador de filas leidas -> es el índice de cada acción del estado inicial
    driverCounter = 0 #contador de drivers diferentes encontrados
    previousDriver="" #el driver anterior encontrado es vacío, porque estamos al inicio

    salida_abierto = False
    for row in tracereader:
         
       
        
        #PRIMERA PRUEBA: USAMOS LOS CAMPOS: ['Conductor_Anonimizado', 'DMA', 'Hora_inicio', 'Hora_fin', 'Duracion[h]', 'Estado' ]
        #Cada row representa un registro de la traza y cada registro reprsenta una tarea ejecutada
        
        #Calcular el simbolo de tarea

        estado = row['Estado']
        prefix = symbolPrefix[estado] # calculo el prefijo asociado al estado leido en row
        taskSymbol = prefix+str(symbolCounter[prefix]) #genero el simbolo de tarea
        diccionario_TaskInstanceSymbol[prefix].append(taskSymbol)
        symbolCounter[prefix]+=1 #incremento el contador de simbolos de esa tarea
        
       
        fecha = row['DMA']
        lahora = setHHMM(row['Hora_inicio'])
        start = fecha + " " + lahora
        
        start = '\"' + start +'\"'
        
        lahora = setHHMM(row['Hora_fin'])
        end  = fecha + " " + lahora
        end = setHHMM(end)
        end = '\"' + end +'\"'

        duracion = str(duracionTominutes(row['Duracion[h]']))

        currentDriver = row['Conductor_Anonimizado']
        driverSymbol, driverCounter = getDriverSymbol(currentDriver, previousDriver,driverCounter)
        
        if driverCounter == 2: #PRIMERA PRUEBA: vamos a extraer solo los registros del primer conductor
            salida.close()
            break
        if not salida_abierto:
            salida_abierto = True
            
            salida_plan = open('sequence_'+currentDriver+'.plan','w') 
        #ESCRIBIR STRING "(row_index taskSymbol taskType[estado] start end duracion driverSymbol)"
        string_salida = "("+str(row_index)+" "+ taskSymbol +" "+ taskType[estado]+" "+start+" "+end+" "+duracion+" "+  driverSymbol+")\n" 
        salida_plan.write(string_salida)
        print(string_salida)
        #FINAL:Incrementar row_index y actualizar previousDriver
        row_index+=1
        previousDriver = currentDriver
    
    salida_Symbols = open('sequence_'+currentDriver+'.TaskSymbol','w') 
    salida_Symbols.write(' '.join(diccionario_TaskInstanceSymbol['C']))
    salida_Symbols.write('\n')
    salida_Symbols.write(' '.join(diccionario_TaskInstanceSymbol['O']))
    salida_Symbols.write('\n')
    salida_Symbols.write(' '.join(diccionario_TaskInstanceSymbol['P']))
    salida_Symbols.write('\n')
    salida_Symbols.write(' '.join(diccionario_TaskInstanceSymbol['E']))
    
    salida_Symbols.close()
        

    
##
