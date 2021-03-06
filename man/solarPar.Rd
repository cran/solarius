% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/solarPar.R
\name{solarPar}
\alias{solarPar}
\alias{solarParCovlistChi}
\alias{solarParCovlistP}
\alias{solarParH2rP}
\alias{solarParIndividuals}
\alias{solarParKurtosis}
\alias{solarParPvar}
\alias{solarParRhoP}
\alias{solarParRhoPOK}
\alias{solarParRhoPP}
\alias{solarParRhoPSE}
\title{Get a parameter value from SOLAR model files.}
\usage{
solarPar(mod, par)

solarParIndividuals(mod)

solarParH2rP(mod)

solarParKurtosis(mod)

solarParCovlistP(mod)

solarParCovlistChi(mod)

solarParRhoP(mod)

solarParRhoPSE(mod)

solarParRhoPP(mod)

solarParRhoPOK(mod)

solarParPvar(mod, modelname = "null0.mod")
}
\arguments{
\item{mod}{An object of \code{solarPolygenic} class. See \code{\link{solarPolygenicClass}}.}

\item{par}{A character, the parameter name.}

\item{modelname}{A character, the file name of a model.
   The default value is \code{"null0.mod"}.
   This argument is only for \code{solarParPvar} function.}
}
\value{
A value of the given parameter.
}
\description{
Get a parameter value from SOLAR model files.
}

