#??zellik 2

library(testthat)

current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Vize_Q1_210401024_onur_karacam.R")

source(relative_path)

spotify_search_artist <- function(artist_name) {
  
  access_token <- spotify_token()$token
  access_token <- gsub("^Bearer\\s+", "", access_token)
  
  
  endpoint <- "https://api.spotify.com/v1/search"
  
  
  params <- list(
    q = artist_name,
    type = "artist"
  )
  
  response <- httr::GET(
    url = endpoint,
    httr::add_headers(
      Authorization = paste("Bearer ", access_token)
    ),
    query = params
  )
  
  
  status_code <- as.numeric(httr::status_code(response))
  
  if (status_code == 200) {
    
    content <- httr::content(response, as = "parsed")
    
    
    valid_results <- sapply(content$artists$items, function(item) !is.null(item$name) & item$name != "")
    
    
    artist_names <- sapply(content$artists$items[valid_results], function(item) item$name)
    artist_ids <- sapply(content$artists$items[valid_results], function(item) item$id)
    
    
    output <- list(
      status_code = status_code,
      search_results = data.frame(artist = artist_names, id = artist_ids, stringsAsFactors = FALSE)
    )
  } else {
    
    output <- list(
      status_code = status_code,
      search_results = NULL
    )
  }
  
  return(output)
}

result <- spotify_search_artist("Sagopa")
print(result$search_results)

