context("test-binned-ggplot2-scales")

df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = c(1, 4, 9)
)

library(ggplot2)

test_that("scale_*_paletteer_binned correctly assigns colors", {
  p1 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_colour_paletteer_binned("scico::berlin")

  p2 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_binned("scico::berlin")

  p3 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_binned("scico::berlin")

  expect_equal(layer_data(p1)$colour, c("#65A6E1", "#183E4F", "#CC7D72"))
  expect_equal(layer_data(p2)$colour, c("#65A6E1", "#183E4F", "#CC7D72"))
  expect_equal(layer_data(p3)$fill, c("#65A6E1", "#183E4F", "#CC7D72"))
})

test_that("scale_*_paletteer_binned correctly used direction", {
  p1 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_binned("scico::berlin", direction = 1)

  p2 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_binned("scico::berlin", direction = 1)

  p3 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_binned("scico::berlin", direction = 1)

  p4 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_binned("scico::berlin", direction = -1)

  p5 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_binned("scico::berlin", direction = -1)

  p6 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_binned("scico::berlin", direction = -1)

  expect_equal(layer_data(p1)$colour, c("#65A6E1", "#183E4F", "#CC7D72"))
  expect_equal(layer_data(p2)$colour, c("#65A6E1", "#183E4F", "#CC7D72"))
  expect_equal(layer_data(p3)$fill, c("#65A6E1", "#183E4F", "#CC7D72"))
  expect_equal(layer_data(p4)$colour, c("#CC7D72", "#4B1501", "#65A6E1"))
  expect_equal(layer_data(p5)$colour, c("#CC7D72", "#4B1501", "#65A6E1"))
  expect_equal(layer_data(p6)$fill, c("#CC7D72", "#4B1501", "#65A6E1"))
})
