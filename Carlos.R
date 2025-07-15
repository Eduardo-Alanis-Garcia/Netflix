##Paso la fecha de cuando se agregaron a las plataformas a formato fecha en otro df
todos_dos = todos |> 
  dplyr::mutate(date_added_ns = lubridate::mdy(date_added))

##Añado una columna con el año de salida
todos_dos = todos_dos |>
  dplyr::mutate(anio_added = lubridate::year(date_added_ns))

##Añado columna para saber platadorma de origen
todos_dos = todos_dos |>
  dplyr::mutate(plataforma = stringr::word(id, 1, sep ='_'))

##Hago dos bases, una para peliculas y otra para progrmas de televisión
peliculas = todos_dos

peliculas = peliculas |>
  dplyr::filter(type == "Movie") |>
  dplyr::select(id, plataforma, title:country, date_added_ns, anio_added, release_year:description)

tv_show = todos_dos

tv_show = tv_show |>
  dplyr::filter(type == "TV Show") |>
  dplyr::select(id, plataforma, title:country, date_added_ns, anio_added, release_year:description)

##Cuantas peliculas añadio cada plataforma por año?
peliculas |>
  dplyr::group_by(plataforma, anio_added) |>
  dplyr::summarise(cantidad = dplyr::n(), .groups = "drop") |>
  print(n = 100)

##Cuantos tv_show añadio cada plataforma por año?
tv_show |>
  dplyr::group_by(plataforma, anio_added) |>
  dplyr::summarise(cantidad = dplyr::n(), .groups = "drop") |>
  print(n = 100)