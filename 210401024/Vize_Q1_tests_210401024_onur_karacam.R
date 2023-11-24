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

#1.5
test_that("spotify_token fonksiyonu dondurdugu listenin ilk elementinin ismi status_code mu", {
  token_result <- spotify_token()
  expect_true("status_code" %in% names(token_result))
})

#1.6
test_that("spotify_token fonksiyonu dondurdugu listenin ilk elementinin class'i numeric mi", {
  token_result <- spotify_token()
  #numeric degil
  expect_equal(class(token_result$status_code), "integer")
})

#1.7
test_that("spotify_token fonksiyonu status_code elemaninin degeri 200 mu", {
  token <- spotify_token()
  expect_is(token, "list")
  expect_equal(token$status_code, 200)
})

#1.8
test_that("spotify_token fonksiyonu ikinci elemaninin ismi token mi", {
  token <- spotify_token()
  expect_is(token, "list")
  expect_equal(names(token)[2], "token")
})

#1.9
test_that("spotify_token fonksiyonu ikinci elemaninin sinifi character mi", {
  token <- spotify_token()
  expect_is(token, "list")
  expect_type(token$token, "character")
})

#1.10
test_that("spotify_token fonksiyonu ikinci elemani 'Bearer ' ile basliyor mu", {
  token <- spotify_token()
  expect_is(token, "list")
  expect_true(startsWith(token$token, "Bearer "))
})

#1.11
test_that("spotify_token fonksiyonu ikinci eleman??n??n karakter de??i??keninin uzunlu??u 122", {
  token <- spotify_token()
  expect_is(token, "list")
  expect_type(token$token, "character")
  expect_equal(nchar(token$token), 122)
})