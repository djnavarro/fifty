
#' Palettes varying only in alpha
#'
#' @param name a colour name
#'
#' @return a palette generating function
#' @export
shades <- function(name) {
  if(!(name %in% grDevices::colours())) {
    stop("'name' must be a recognised colour()", call. = FALSE)
  }
  pal <- function(n = 50) {
    cols <- character(0)
    base <- grDevices::col2rgb(name, alpha = TRUE)/255
    for(i in 1:n) {
      x <- base
      x["alpha"] <-1 - i/n
      cols[i] <- do.call(grDevices::rgb, as.list(x))
    }
    return(cols)
  }
  return(pal)
}

#' Visualise the output of a palette generating function
#'
#' @param f The palette generating function
#' @export
palette_show <- function(f) {
  graphics::image(matrix(1:50, ncol = 1), col = f(50), axes = FALSE)
}
