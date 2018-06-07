#' Make a Waffle Plot
#'
#' @param vec a numeric vector of strictly non-negative values
#' @param title the title of the plot. Defaults to the name of \code{vec}.
#' @param colors a character vector of colors the same length as \code{vec}.
#'    Defaults to colors from \code{\link[grDevices]{rainbow}}.
#'
#' @return Nothing. A waffle plot is displayed.
#' @export
#'
#' @importFrom waffle waffle
#' @importFrom grDevices rainbow
#'
#' @examples
#'   MakeWaffle(vec = runif(5), title = "Waffle plot of random proportions")
MakeWaffle <- function(vec, title, colors){
  
  if(missing(colors)){
    colors <- rainbow(length(vec))
  }
  
  if(missing(title)){
    title <- paste("Waffle plot of", deparse(substitute(vec)))
  }
  
  waffle(round(vec / sum(vec) * 100),
         rows = 10,
         size = 0.5,
         flip = TRUE,
         title = title,
         colors = colors,
         reverse = TRUE)
  
}


