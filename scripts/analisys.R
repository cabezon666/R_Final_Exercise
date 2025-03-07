# ==== scripts/analisis.R ====
# Funciones de análisis básicas

# Resumen estadístico
resumen_estadistico <- function(datos) {
  # Generar resumen básico
  resumen <- summary(datos)
  
  # Guardar en archivo de texto
  capture.output(resumen, file = "output/resumen_estadistico.txt")
  
  # Mostrar en consola
  print(resumen)
}

# Análisis por grupo
analisis_por_grupo <- function(datos) {
  # Agrupar por cilindros
  por_cilindros <- datos %>%
    group_by(cyl) %>%
    summarize(
      conteo = n(),
      mpg_promedio = mean(mpg),
      hp_promedio = mean(hp)
    )
  
  # Guardar resultados
  write.csv(por_cilindros, "output/stats_por_cilindros.csv", row.names = FALSE)
  
  # Agrupar por transmisión
  por_transmision <- datos %>%
    group_by(am) %>%
    summarize(
      conteo = n(),
      mpg_promedio = mean(mpg),
      hp_promedio = mean(hp)
    )
  
  # Guardar resultados
  write.csv(por_transmision, "output/stats_por_transmision.csv", row.names = FALSE)
  
  return(list(por_cilindros = por_cilindros, por_transmision = por_transmision))
}