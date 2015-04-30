### Our previous download() function only downloads a single file. How can you use partial() and lapply() to create a function that downloads multiple files at once? What are the pros and cons of using partial() vs. writing a function by hand?

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

