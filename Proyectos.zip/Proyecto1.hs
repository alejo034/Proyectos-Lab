--Proyecto 1 Alg y Est Datos

--1a)
--Función que verifica si un entero es igual a 0

esCero :: Int -> Bool
esCero x =  x == 0 

--1b)
--Función que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo x = x > 0 


--1c) 
--verifica si un caracter es una vocal en minuscula.

esVocal :: Char -> Bool
esVocal x =  (x == 'a') || (x == 'e') || (x=='i')  || (x=='o') || (x == 'u')


 --2a) (Revisar) que verifica que todos los elementos de una lista
--sean True

--paratodo :: [Bool] -> Bool
--paratodo [ ] = True
--paratodo (x:xs) =
-- x == False = False
-- x == True = paratodo xs
 
paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x:xs)
        | x == True = paraTodo xs
        | x == False = False




--2b) que calcula la suma de todos los elementos de una lista de enteros.

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--2c) que calcula el producto de todos los elementos de la lista de enteros.

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs


--2d) Que toma un numero n y calcula n!.

factorial :: Int -> Int
factorial 0 = 1
factorial x =  x* factorial (x-1)




--2e) Utiliza la función sumatoria para definir, promedio :: [Int] -> Int, que toma
--una lista de números no vacía y calcula el valor promedio (truncado, usando división
--entera).


promedio :: [Int] -> Int
promedio xs =  sumatoria xs `div` length xs

--3 Pertenece 
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) |x == n = True 
                   |x /= n = pertenece n xs


{-4a)
 Reemplazamos el caracter ' en el nombre de la función por "1". 
 Funcion paratodo que dada una lista xs de tipo [a] y un
predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el
predicado t. 
Verificamos la funcion utilizando de predicado alguna otra ya definida como por ejemplo esCero-}

paratodo1 :: [a] -> (a -> Bool) -> Bool
paratodo1 [] t = True
paratodo1 (x:xs) t = t x && paratodo1 xs t
 {- paratodo1 [1,2,3,4] esCero 
False -}

--4b) Determina si algun elemento de xs satisface el predicado t.

existe1 :: [a] -> (a -> Bool) -> Bool
existe1 [] t = False 
existe1 (x:xs) t | t x == True = True  
                 | otherwise = existe1 xs t
 
--4c) Dada una lista xs de tipo [a] y, una funcíon que tome elementos de tipo a y devuelva enteros, calcula la
--suma de los valores que resultan de la aplicacion de t a los elementos de xs.

sumatoria1 :: [a] -> (a -> Int) -> Int
sumatoria1 [] t = 0
sumatoria1 (x:xs) t = t x + sumatoria1 xs t
 

--4d) Dada una lista de xs de tipo [a] y una funcíon t :: a -> Int, calcula el producto de los valores que resultan de la
--aplicacion de t a los elementos de xs.

productoria1 :: [a] -> (a -> Int) -> Int
productoria1 [] t = 1
productoria1 (x:xs) t = t x * (productoria1 xs t) 

--5)
--Definır nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo2 (sin
--recursion ni an ́alisis por casos!).
paratodo2 :: [Bool]-> Bool
paratodo2 xs = paratodo1 xs (== True)
 
--6 Funciones por composicion, sin usar recursíon ni analisis por casos.
--a) Verifica que todos los n ́umeros de una lista sean pares.

todosPares :: [Int] -> Bool
todosPares xs = paratodo1 xs even
 
--6b) Verifica si existe alg ́un n ́umero dentro del segundo parametro que sea multiplo del primer parametro.
--Definimos una funcion auxiliar que nos indica cuando un numero es múltiplo de otro 
esMulti :: Int -> Int -> Bool
esMulti n m = (mod n m) == 0 || (mod m n) == 0
 
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe1 xs (esMulti n)
 
--6c) Dado un n ́umero no negativo n, calcula la suma de los primeros n cuadrados,
 
cuadrado :: Int-> Int
cuadrado x = x*x

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria1 [0..(x-1)] cuadrado
 
--6d) Reedefinimos la función factorial para evitar usar recursion.
 
factorial1 :: Int -> Int
factorial1 z = productoria1 [1..z] (*1)

--6e)
-- Que calcula el producto de todos los n ́umeros pares de una lista.

filtroPares :: Int -> Int
filtroPares x 
              | mod x 2 == 0 = x
              | otherwise = 1

multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria1 xs filtroPares 

--7)
--- La funcion map toma una funcion y se lo aplica a cada elemento de la lista.
--- La funcion Filter toma una funcion(que devuelve un bool) y se la aplica a cada elemento de la lista y te devuelve una lista con los elementos que la cumplan.
-- Equivale a [2, -3, 7, 3, -7]
-- [1, 6, 2]

--8a) Funcion que dada una lista de numeros xs, devuelve la lista que resulta de
--duplicar cada valor de xs.
--(Recursion)
duplicaLista :: [Int] -> [Int]
duplicaLista [] = []
duplicaLista (x:xs) = (x*2):duplicaLista xs 

--b) (Utilizando funcion map)
duplicaMap :: [Int] -> [Int]
duplicaMap xs = map (*2) xs

-- 9) Dada una lista de numeros xs, calcula una lista que tiene como
--elementos aquellos n ́umeros de xs que son pares.
--a) Usando recursion
paresLista :: [Int] -> [Int] 
paresLista [] = []
paresLista (x:xs)
 | (mod x 2) == 0 = x : paresLista xs
 | otherwise = paresLista xs 

--9b) Usando filter
paresFilter :: [Int] -> [Int]
paresFilter xs = filter even xs 


--9c)Mejorada
multiplicaPares1 :: [Int] -> Int
multiplicaPares1 xs  = productoria1 (filter even xs) id 


--10a) La funcion primIgualesA toma un valor y una lista, y calcula el tramo inicial mas largo de
--la lista cuyos elementos son iguales a ese valor.
primIgualesA ::  (Eq a) => a -> [a] -> [a]  
primIgualesA a [] = [] 
primIgualesA a (x:xs)
  | x == a = x: primIgualesA a xs 
  | x /= a = []
 
--10b) Usando takeWhile
primIgualesB ::  (Eq a) => a -> [a] -> [a] 
primIgualesB z xs = takeWhile (== z) xs

--11) Toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si.
--primIguales
-- a) Por recursion

primIguales1 :: Eq a => [a] -> [a]
primIguales1 [] = []
primIguales1 [x]= [x]
primIguales1 (y:ys) = primIgualesB y (y:ys)

-- b) Usando 2 casos

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x]= [x]
primIguales (x:(y:ys))
        | x == y  =  x: primIguales (y:ys)
        | otherwise = [x]



 --12) Definı de manera recursiva la funcion cuantGen (denota la
--cuantificacion generalizada):


cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = op (t x) (cuantGen op z xs t)

sumat xs = cuantGen (+) 0 xs id

produt xs = cuantGen (*) 1 xs id

paratodt xs = cuantGen (&&) True xs id

exist xs = cuantGen (||) False xs id


{--13 Decidır si estan bien tipados, y en tal caso dar los tipos de cada subexpresion. En caso de estar bien tipado, ¿el patron cubre todos los casos
de definicion?

a)
      f :: (a, b) -> ...
      f (x, y) = ...
      Si estan bien tipados, ya que la funcion tiene como parametro
      una tupla de tipo a , b y es totalmente valido.
 b)
      f :: [(a, b)] -> ...
      f (a, b) = ...
      Esta mal tipado, ya que la función define como uno de los parametros de
      entrada una lista de tuplas, y luego llama solamente a una tupla, y no a
      la lista en si. Además, no contempla el caso en que la lista es vacia.

 c)   f :: [(a,b)] -> ...
      f (x:xs) = ...
      Esta bien tipado pero no cubre todos los casos.
      El caso donde xs es una lista vacio no esta contemplado.

 d)   f :: [(a,b)] -> ...
      f ((x,y) : ((a,b) : xs))
      Esta bien tipado pero no cubre todos los casos.
      El caso donde xs es una lista vacio no esta contemplado

 e)   f :: [(Int, a)] -> ...
      f [(0, a)] = ...
      Esta bien tipado ya que la funcion tiene como parametro [(Int,a)] y
      en la segunda linea se escribio f [(0,a)] = ... donde esto esta
      perfectamente definido  ya que le paso un Int que es el 0 y un tipo
      argumento de tipo a.

 f)   f :: [(Int, a)] -> ...
      f ((x, 1) : xs) = ...
      Esta función no esta bien tipada, ya que no contempla los casos en que el
      parametro "a" no sea de la Clase Num, mas especificamente, de tipo entero.

 g)   f :: (Int -> Int) -> Int -> ...
      f a b = ...
      En este caso se encuentra bien tipado, ya que tomo "a" como mi predicado
      que me retorna Int y "b" como una varaible cualquiera de tipo Int.

 h)  f :: (Int -> Int) -> Int ->
     f a 3 = ..
     La función se encuentra bien tipada, pero al haber fijado el segundo
     argumento que toma la función, no va a cubrir todos los casos.

 i)   f :: (Int -> Int) -> Int -> ...
      f 0 1 2 = ...
      En este caso no se encuentra bien tipada, ya que se encuentra definido un
      predicado de tipo int y otro argumento de tipo Int, mientras que se
      encuentran fijos 3 argumentos.
--}


--Ejercicio 14 Dar al menos una definci ́on cuando sea posible. ¿Podes dar alguna otra definicion alternativa a la que diste en cada caso?

{--
a) f :: (a ,b) -> b
   f (a,b) = b

b) f :: (a, b) -> c
No podemos dar una definición alternativa. Esta función, como se encuentra
definida, no nos asegura que se cumpla para todos los posibles casos.

c) f :: (a -> b) -> a -> b
   f t a = t(a)

d) f :: (a -> b) -> [a] - [b]
   f t xs = t(xs) --Donde t(xs) es la aplicación de la función map

e) f :: (a -> b) -> (b -> c) -> a -> c
   f h g a = g(h(a)) --composición de funciones
--}
