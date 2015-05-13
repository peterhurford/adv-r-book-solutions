### Our previous download() function only downloads a single file.
### How can you use partial() and lapply() to create a function tha
### downloads multiple files at once? 

old_download <- function(url, ...) {
  download.file(url, ...)
}

new_download <- function(urls, ...) {
  lapply(urls, function(url) {
    download.file(url, ...)
  })
}

new_download_with_partial <- function(urls, ...) {
  lapply(urls, pryr::partial(download.file))
}


### What do you think of the result? Is it easier or harder to read?

# Easier to read.
