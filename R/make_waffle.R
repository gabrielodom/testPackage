#' Make a Waffle Plot
#'
#' @param vec a numeric vector of strictly non-negative values
#' @param title the title of the plot
#' @param colours a character vector of colours the same length as \code{vec}
#'
#' @return Nothing. A waffle plot is displayed
#' @export
#'
#' @importFrom waffle waffle
#' @importFrom grDevices rainbow
#'
#' @examples
#'   MakeWaffle(vec = runif(5), title = "test")
MakeWaffle <- function(vec, title, colours = NULL){

  if(is.null(colours)){
    colors <- rainbow(length(vec))
  }

  waffle(round(vec / sum(vec) * 100),
         rows = 10,
         size = 0.5,
         flip = TRUE,
         title = title,
         colors = colors,
         reverse = TRUE)

}


