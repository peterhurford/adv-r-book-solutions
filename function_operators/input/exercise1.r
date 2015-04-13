### Our previous download() function only downloads a single file. How can you use partial() and lapply() to create a function that downloads multiple files at once? What are the pros and cons of using partial() vs. writing a function by hand?

#' Downloads multiple files.
#'
#' @param files character. A vector of urls to download from.
#' @param baseurl character. This baseurl is prepended to all the files.
#' @param destfolder character. The path on your computer you want to download files to.
#' @param method character. The download method. Currently download methods are
#'    "internal", "wget", "curl" and "lynx".  See download.file for details.
#' @param ... Other arguments to pass to download.file.
download_multiple <- function(files, baseurl, destfolder, method, ...) {
  lapply(
    paste0(baseurl, files),
    pryr::partial(download.file, destfile = destfolder, method = 'wget')
  )
}
