library(testthat)

current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Vize_Q2_210401024_onur_karacam.R")

source(relative_path)

# Test 2.1
test_that("Global Workspace 'spotify_search_artist' degiskenine sahip mi", {
  expect_true(exists("spotify_search_artist", envir = .GlobalEnv))
})

# Test 2.2
test_that("'spotify_search_artist' degiskeninin tipi function mi", {
  expect_equal(typeof(spotify_search_artist), "closure")
})

# Test 2.3
test_that("spotify_search_artist() herhangi bir artist ismi ile cagrildiginda dondurdugu cikti bir liste mi
", {
  result <- spotify_search_artist("Motive")
  expect_true(is.list(result))
})

# Test 2.4
test_that("spotify_search_artist cagrildiginda dondurdugu listenin iki elementi mi var", {
  result <- spotify_search_artist("Motive")
  expect_equal(length(result), 2)
})