# Eliminar NA antes del conteo
peliculas_filtradas = dplyr::filter(peliculas, !is.na(anio_added))

##Para ajustar escala
maximo = max(peliculas_filtradas |>
               dplyr::count(plataforma, anio_added) |>
               dplyr::pull(n))

## Primer gráfico: peliculas añadidas por año en cada platadorma
ggplot2::ggplot(
  dplyr::group_by(peliculas_filtradas, plataforma, anio_added) |>
    dplyr::summarise(cantidad = dplyr::n(), .groups = "drop"),
  ggplot2::aes(x = anio_added, y = cantidad, color = plataforma)
) +
  ggplot2::geom_line() +
  ggplot2::geom_point() +
  ggplot2::labs(
    title = "Peliculas añadidas por año",
    x = "Año",
    y = "Cantidad de peliculas",
    color = "Plataforma"
  ) +
  ggplot2::scale_y_continuous(limits = c(0,maximo*1.1)) +
  ggplot2::theme_dark()