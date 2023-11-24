library(testthat)

current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Vize_Q1_210401024_onur_karacam.R")

source(relative_path)

#1.1
test_that("spotify_token degikeni Global Workspace'de tanimli mi", {
  expect_true(exists("spotify_token"))
})

#1.2
test_that("spotify_token degiskeni bir fonksiyon mu", {
  expect_type(spotify_token, "closure")
})

#1.3
test_that("spotify_token fonksiyonu bir liste dondurur mu", {
  token <- spotify_token()
  expect_is(token, "list")
})

#1.4
test_that("spotify_token fonk iki elemanli bir fonk mu", {
  token <- spotify_token()
  expect_is(token, "list")
  expect_length(token, 2)
})