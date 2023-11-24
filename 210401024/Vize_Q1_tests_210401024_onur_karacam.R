library(testthat)

current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Vize_Q1_210401024_onur_karacam.R")

source(relative_path)

#1.1
test_that("spotify_token degikeni Global Workspace'de tanimli mi", {
  expect_true(exists("spotify_token"))
})

