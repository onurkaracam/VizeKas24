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

# Test 2.5
test_that("spotify_search_artist cagrildiginda dondurdugu listenin ilk elementinin ismi 'status_code' mu", {
  result <- spotify_search_artist("Motive")
  expect_equal(names(result)[1], "status_code")
})

# Test 2.6
test_that("Class of the first element should be numeric", {
  result <- spotify_search_artist("Motive")
  expect_equal(class(result$status_code), "numeric")
})

# Test 2.7
test_that("Value of 'status_code' should be equal to 200", {
  result <- spotify_search_artist("Motive")
  expect_equal(result$status_code, 200)
})

# Test 2.8
test_that("Second element name of the result should be 'search_results'", {
  result <- spotify_search_artist("Motive")
  expect_equal(names(result)[2], "search_results")
})

# Test 2.9
test_that("Class of the second element should be data.frame", {
  result <- spotify_search_artist("Motive")
  expect_true(is.data.frame(result$search_results))
})

# Test 2.10
test_that("Second element should have two columns", {
  result <- spotify_search_artist("Motive")
  expect_equal(ncol(result$search_results), 2)
})

# Test 2.11
test_that("Column names of the second element should be c('artist', 'id')", {
  result <- spotify_search_artist("Motive")
  expect_equal(colnames(result$search_results), c('artist', 'id'))
})

# Test 2.12
test_that("Value of 'id' column in the first row of the second element should be '22WZ7M8sxp5THdruNY3gXt'", {
  result <- spotify_search_artist("The Doors")
  expect_equal(result$search_results$id[1], "22WZ7M8sxp5THdruNY3gXt")
})