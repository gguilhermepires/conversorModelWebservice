import json
arq = open('dados2.sql', 'r')

texto = arq.readlines()

flagCreate=False
flagTable=False
flagCorpoSQL=False

json_data=""
vetJson=[]

#***********   json *******    
for linha in texto :
    lEspaco = linha.split(" ")
    
    
    if linha.find("CREATE")==0  and  linha.find("TABLE")==0:
        print("akiiiiiiiiiiiiiiii")
    #procura comando create tble
    for itemLinha in lEspaco:
        if "CREATE"  in itemLinha:
            print("Achou create")
            #print(lEspaco)
            #print(linha.find("CREATE"))
            flagCreate=True           
        if "TABLE"  in itemLinha:
            flagTable=True
            print("Achou table")        
        if "InnoDB"  in itemLinha:
            
            json_data = json_data+'}]}'            
            vetJson.append(json_data)
            #print(json_data)

            json_data=""
            flagCorpoSQL = False
            flagTable = False
            flagCreate = False
            
            print("InnoDB")
    
        
    if flagCorpoSQL :
        if "INT"  in linha:
            if not ("CONSTRA"  in linha):
                
                print("int")
                nlinha = linha.split("INT")
                nlinha[0] = nlinha[0].replace(" ", "")
                nlinha[0] = nlinha[0].replace("`", "")
                if json_data.endswith(','):                
                    json_data =json_data +'"'+nlinha[0]+'":"INT"'
                else :
                    if json_data.endswith('{'):   
                        json_data = json_data+ '"'+nlinha[0]+'":"INT"'
                    else:
                        json_data = json_data+ ',"'+nlinha[0]+'":"INT"'
                
                        
        if "VARCHAR"  in linha:
            print("varchar")
            nlinha = linha.split("VARCHAR")
            nlinha[0] = nlinha[0].replace(" ", "")
            nlinha[0] = nlinha[0].replace("`", "")
            if json_data.endswith(','):                
                json_data =json_data +'"'+nlinha[0]+'":"VARCHAR"'
            else :
                if json_data.endswith('{'):   
                    json_data = json_data+ '"'+nlinha[0]+'":"VARCHAR"'
                else:
                    json_data = json_data+ ',"'+nlinha[0]+'":"VARCHAR"'
        
    if flagTable == True and flagCreate == True:
        print("achei comando create table")
        flagTable = False
        flagCreate = False
        flagCorpoSQL = True
        vet = linha.split(".")        
        vet[1] = vet[1].replace(" ", "")
        vet[1] = vet[1].replace("(", "")
        vet[1] = vet[1].replace("`", "")
        vet[1] = vet[1].replace("\n", "")
        vet[1] = vet[1].replace("\r", "")
        json_data = '{"tabela":"'+vet[1]+'","variaveis":[{'
        #print("linha: "+linha)
        #print(json_data)
        
        
                    
arq.close()
## inicia processamento
###terminou o json
for n in vetJson:
    #print(n)
    try:    
        #data = json.loads(n)
        escreveObjeto(n)
    except (ValueError, KeyError, TypeError):
        print ("JSON format error")
    print("  ")
    print("  ")
    '''
    
'''
def escreveObjeto(textoJson):    
    try:    
        data = json.loads(textoJson)
        print(data['tabela'])
        print(data['variaveis'][0])
        arq1= open('saida\\'+data['tabela']+'.php', 'w')
        arq1.write('<?php')
        arq1.write('class '+data['tabela']+' {')
        arq1.write('// database connection and table name')
        arq1.write('private $conn;')
        arq1.write('private $table_name = "'+data['tabela']+'";')

        #loop para adicionar as variaveis
        # arq1.write("")
        # arq1.write("")
        #
        
        arq1.write("// constructor with $db as database connection")
        arq1.write("public function __construct($db){")
        arq1.write("   $this->conn = $db;")
        arq1.write("}")

        
        arq1.write("// read products")
        arq1.write("function read(){")
        arq1.write("// select all query")
        arq1.write("$query =")
        ##adicionar query select
        arq1.write("// prepare query statement")
        arq1.write("    $stmt = $this->conn->prepare($query);")
        arq1.write("// execute query")
        arq1.write("$stmt->execute();")
        arq1.write(" return $stmt;")
        arq1.write("}")

        
        arq1.write("// create product")
        arq1.write("function create(){")
        arq1.write("// query to insert record")
        #adicionar query
        arq1.write("// prepare query")
        arq1.write(" $stmt = $this->conn->prepare($query);")
        arq1.write("// sanitize")
        #ajustar parametros query
        arq1.write("// bind values")
        # fazer // bind values

        
        arq1.write("// execute query")
        arq1.write(" if($stmt->execute()){")
        arq1.write("   return true;")
        arq1.write(" }")
        arq1.write("  return false;")
        arq1.write("}")
        
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("")
        arq1.write("// read products")
    except (ValueError, KeyError, TypeError):
        print ("JSON format error")
    
    arq1.close()
print("fim")

