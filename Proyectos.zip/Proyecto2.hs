--1a)
--Implementacion de tipo carrera
data Carrera = Matematica | Fisica | Computacion | Astronomia 

--1b) 
{--Definı la siguiente funcion, usando pattern matching: titulo :: Carrera -> String
que devuelve el nombre completo de la carrera en forma de string. Por ejemplo, para el
constructor Matematica, debe devolver ”Licenciatura en Matematica”.--}

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"  
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

--1c)
{--Para escribir musica se utiliza la denominada notacion musical, la cual consta de
notas (do, re, mi, ...). Ademas, estas notas pueden presentar algun modificador ]
(sostenido) o [(bemol), por ejemplo do], si[, etc. Por ahora nos vamos a olvidar de
estos modificadores (llamados alteraciones) y vamos a representar las notas basicas.--}

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si  deriving (Eq,Ord,Show,Bounded)

--1d)

{-- El sistema de notacion musical anglosajon, tambien conocido como notacion o cifrado
americano, relaciona las notas basicas con letras de la A a la G. Este sistema se usa por
ejemplo para las tablaturas de guitarra. Programar usando pattern matching la funcion: --}

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--2) 
{--Completar la definici ́on del tipo NotaBasica para que las expresiones sean v ́alidas y no generen error. 
Ayuda: usar deriving con m ́ultiples clases. --}

--data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq,Ord,Show,Bounded)

--2a)

--data NotaBasica = Do|Re|Mi|Fa|Sol|La|Si  deriving (Eq,Ord,Show,Bounded)

--3a)

--Que calcula cual es el menor valor de una lista de tipo [a].

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) | x < minimoElemento xs = x
                      | otherwise = minimoElemento xs  

--3b)
{--Definir la funcion minimoElemento1 de manera tal que el caso base para la lista vacia
este definido. Para ello revisar la clase Bounded.--}

minimoElemento1 :: (Bounded a, Ord a) => [a] -> a
minimoElemento1 [] = maxBound 
minimoElemento1 (x:xs) | x < minimoElemento1 xs = x
                       | otherwise = minimoElemento1 xs

--3c)
{--Usar la funcion minimoElemento para determinar la nota maas grave de la melodiıa: [Fa, La, Sol, ""Re""", Fa] 
Re es la MAS grave en esta lista NotaBasica --}

notaGrave :: [NotaBasica] -> NotaBasica
notaGrave xs = minimoElemento xs

--4 Implementar los tipos Ingreso, Cargo, Area y Persona como estan definidos arriba.
-- Ingreso es un sinonimo de tipo.
type Ingreso = Int

-- Cargo y Area son tipos enumerados
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
data Area = Administrativa | Ensenanza | Economica | Postgrado

-- Persona es un tipo algebraico 
data Persona = Decane -- constructor sin argumento  
            | Docente Cargo -- constructor con un argumento
            | NoDocente Area -- constructor con un argumento
            | Estudiante Carrera Ingreso -- constructor con dos argumentos
           
--4b) El tipo de docente es Persona

--4c)
{-- Dada una lista de personas xs, y un cargo c, devuelve la cantidad de docentes incluidos en xs 
que poseen el cargo c --}

cuantos_doc :: [Persona] -> Cargo -> Int  
cuantos_doc [] c = 0
cuantos_doc ((Docente x):xs) c
           | mismoCargo x c = 1 + cuantos_doc xs c
           | otherwise = cuantos_doc xs c 
cuantos_doc (_:xs) c = cuantos_doc xs c

mismoCargo :: Cargo -> Cargo -> Bool
mismoCargo Titular Titular = True
mismoCargo Asociado Asociado = True
mismoCargo Adjunto Adjunto = True
mismoCargo Asistente Asistente = True
mismoCargo Auxiliar Auxiliar = True
mismoCargo _ _ = False

--d) Utilizando la función filter.

cargoPersona :: Cargo -> Persona -> Bool
cargoPersona c (Docente a) | mismoCargo c a = True
                           |otherwise = False
cargoPersona c _ = False

cuantos_doc2 :: [Persona] -> Cargo -> Int
cuantos_doc2 [] c = 0
cuantos_doc2 xs c = length (filter (cargoPersona c) xs)
{--Mete a los docentes en una lista, EL filter toma la lista y le aplica cargoPersona c --}

--5a)
{--Implementa los tipos NotaMusical, Alteracion y la funci ́on sonido como est ́an
definidos arriba.--}

data Alteracion = Bemol | Sostenido  | Natural deriving (Show,Eq,Ord)
data NotaMusical = Nota NotaBasica Alteracion deriving (Show,Eq,Ord)
           
sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

--b)
{-- Definir la funcion sonidoCromatico :: NotaMusical -> Int que devuelve el so-
nido de una nota, incrementando en uno su valor si tiene la alteracion Sostenido,
decrementando en uno si tiene la alteracion Bemol y dejando su valor intacto si la
alteracion es Natural--}

sonidoCromatico :: NotaMusical -> Int 
sonidoCromatico (Nota n Bemol) = (sonido n)-1
sonidoCromatico (Nota n Sostenido) = (sonido n)+1
sonidoCromatico (Nota n Natural) = sonido n

--c)
{--Incluir el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
mismo valor de sonidoCromatico se consideren iguales.--}

sonidoCromaticoIg :: NotaMusical -> NotaMusical -> Bool 
sonidoCromaticoIg (Nota x y) (Nota h z) 
        | sonidoCromatico (Nota x y) == sonidoCromatico (Nota h z)  = True    
        | otherwise = False

--d)
{--Incluir el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
que una nota es menor o igual a otra si y s ́olo si el valor de sonidoCromatico para la
primera es menor o igual al valor de sonidoCromatico para la segunda.--}

sonidoCromaticoMM :: NotaMusical -> NotaMusical -> Bool 
sonidoCromaticoMM (Nota x y) (Nota h z) 
        | sonidoCromatico (Nota x y) <= sonidoCromatico (Nota h z)  = True    
        | otherwise = False

{--6
a)Definir la funcion primerElemento que devuelve el primer elemento de una lista no
vacia, o Nothing si la lista es vacıa.
--}
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just (x)

{--7
a1) Elimina de la cola a la persona que esta
en la primer posicion de una cola, por haber sido atendida. Si la cola esta vacıa,
devuelve Nothing.
 --}

data Cola = VaciaC | Encolada Persona Cola

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada p r) = Just(r)
 {--a2) Agrega una persona a una cola de personas, en la  ́ultima posicion.--}

encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada r cs) =  Encolada r (encolar p cs)

{--a3) Que devuelve el primer docente dentro de la cola que tiene un cargo que se corresponde con el segundo parametro.
Si esa persona no existe, devuelve Nothing.--}

busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC c = Nothing
busca (Encolada (Docente a) col) c     
        | cargoPersona c (Docente a) == True = Just (Docente a)
busca (Encolada _ xs) c = busca xs c 

{--b) ¿A que otro tipo se parece Cola?. Cola se parece al tipo recursivo x:"xs" (Listas).
--}

 {--8) *Encontrar la definición de una palabra  en un diccionario.
       *Encontrar el lugar de votación de una personas. 

a) ¿Como se debe instanciar el tipo ListaAsoc para representar la informacion almacenada
en una guıa telefonica?

type guiaTelef = ListaAsoc String String Int, donde un string corresponde a la dirección, el otro string al nombre y el Int
al número de telefono respectivamente. 
 --}
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show, Eq) 
type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

 --81) Que devuelve la cantidad de datos en una lista.
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b xs) = 1 + la_long xs

 --82) Que devuelve la concatenacion de dos listas de asociacion.
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia
la_concat Vacia (Nodo y s xs) = Nodo y s xs
la_concat (Nodo a b zs) Vacia = Nodo a b zs
la_concat (Nodo a b zs) xs = Nodo a b (la_concat xs zs) 

-- lo probamos con la_concat (Nodo "Alejo" "Carezzana" Vacia) (Nodo "Estudiante" "Famaf" Vacia)

 --83) Que agrega un nodo a la lista de asociaciones.
 
la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = (Nodo a b Vacia)
la_agregar nod a b = (Nodo a b nod)

--84) Que transforma una lista de asociacion en una lista de pares clave-dato.
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b ys) = (a,b) : la_pares ys

--85) que dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing.
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo a b xs) c
        | a == c = Just b
        | otherwise = la_busca xs c 

 --86) Que dada una clave a elimina la entrada en la lista.
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar c (Nodo a b xs)
        | a == c = xs
        | otherwise = Nodo a b (la_borrar c xs)

--9}
data Arbol a = | Rama (Arbol a) a (Arbol a)

-- a)Funcion que dado un arbol devuelve la cantidad de datos almacenados
a_long Hoja = 0
a_long (Rama a _ b) = 1 + a_long a + a_long b

-- b)Función que dado un árbol devuelve la cantidad de hojas
b_hojas :: Arbol a -> Int
b_hojas Hoja = 1
b_hojas (Rama a _ b) = b_hojas a + b_hojas b

-- c)Función que dado un árbol que contiene números, los incrementa en uno
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama a n b) = Rama (a_inc a) (n + 1) (a_inc b)

-- d)Función que dada una función y un árbol, devuelve el árbol con la misma estructura, que resulta de aplicar la función a cada uno de los elementos del árbol.
--Reprogramarla usando map
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja = Hoja
a_map fun (Rama a x b) = Rama (a_map fun a) (fun x) (a_map fun b)

a_min :: Ord a => Arbol a -> a
a_min (Rama Hoja n1 Hoja) = n1
a_min (Rama a1 n1 Hoja) = min n1 (a_min a1)
a_min (Rama Hoja n1 a2) = min n1 (a_min a2)
a_min (Rama a1 n1 a2) = min n1 (min (a_min a1) (a_min a2))