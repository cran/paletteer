% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/paletteer_c.R
\name{paletteer_c}
\alias{paletteer_c}
\title{Get continuous palette by package and name}
\usage{
paletteer_c(palette, n, direction = 1)
}
\arguments{
\item{palette}{Name of palette as a string. Must be on the form
packagename::palettename.}

\item{n}{Number of colors desired. Must be supplied.}

\item{direction}{Either \code{1} or \code{-1}. If \code{-1} the palette will be reversed.}
}
\value{
A vector of colors.
}
\description{
Available package/palette combinations are available in the data.frame
\code{\link[paletteer]{palettes_c_names}}.
}
\examples{
\dontshow{if (rlang::is_installed("scico")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
paletteer_c("scico::berlin", 100)
\dontshow{\}) # examplesIf}
}
