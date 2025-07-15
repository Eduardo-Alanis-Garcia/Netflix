### Abrir bases de datos
netflix = read.csv("Datos/netflix_titles.csv")
disney = read.csv("Datos/disney_plus_titles.csv")
amazon = read.csv("Datos/amazon_prime_titles.csv")
hulu = read.csv("Datos/hulu_titles.csv")


# Modificamos las bases de datos, la abrimos despues creamos una nueva columna llamada id 
# y posteriormente quitamos nuestra primera columna que teniamos inicialmente con nombre show_id y ponemos primero id
# ademas con type:description dejamos todas las demas igual
netflix = netflix |> 
  dplyr::mutate(id = paste0("netflix_", 1:nrow(netflix))) |> 
  dplyr::select(id, type:description)

disney = disney |> 
  dplyr::mutate(id = paste0("disney_", 1:nrow(disney))) |> 
  dplyr::select(id, type:description)

amazon = amazon |> 
  dplyr::mutate(id = paste0("amazon_", 1:nrow(amazon))) |> 
  dplyr::select(id, type:description)

hulu = hulu |> 
  dplyr::mutate(id = paste0("hulu_", 1:nrow(hulu))) |> 
  dplyr::select(id, type:description)

# Verificar que el nombre de la columnas que sean iguales para unir todas las bases
all(names(netflix) == names(disney)) # Si regresa TRUE todas las columnas son iguales y ordenadas igualmente
all(names(netflix) == names(amazon))
all(names(netflix) == names(hulu))


todos = dplyr::bind_rows(netflix, disney, amazon, hulu)  ## Junto las bases de datos por filas
# la linea de codigo anterior es equivalente a todos = rbind(netflix, disney, amazon, hulu)


### Guardas lo hecho en un csv
write.csv(todos, "Datos/Todas_Bases.csv", fileEncoding = "UTF-8", row.names = F)


# Tienes que instalar la libreria dplyr es con el codigo install.packages("dplyr")
# Cosas a checar
# Proyectos de R Studio, es en el apartado de arriba File y guscar como funcionan estos
# Librerias importantes dplyr, tidyr  
# Funciones importantes de dplyr son: dplyr::select(), dplyr::mutate(), dplyr::group_by(), dplyr::summarise()
# Funciones importantes de tidyr son tidyr::pivot_longer(), tidyr::pivot_wider()
# Funciones importantes de R sin necesidad de instalar nada es grep(), paste0(), paste(), unique(), class()


# Ejemplo de uso de la funcion de dplyr::group_by(), dplyr::summarise()

clasificacion = todos |> 
  dplyr::group_by(type) |> 
  dplyr::summarise(contar = dplyr::n())






