datos = read.csv("Datos/netflix_titles.csv")
conteo_tipo = datos |> 
  dplyr::group_by(type) |> 
  dplyr::summarise(conteo = dplyr::n())

conteo_director = datos |> 
  dplyr::group_by(director) |> 
  dplyr::summarise(conteo = dplyr::n())


