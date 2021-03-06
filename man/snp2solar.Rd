% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/solar.lib.R
\name{snpdata2solar}
\alias{snpcovdata2solar}
\alias{snpdata2solar}
\alias{snpmap2solar}
\title{Export snp genotypes, genotype covariates and amp to SOLAR}
\usage{
snpdata2solar(mat, dir)

snpcovdata2solar(mat, dir, nGTypes = FALSE, out)

snpmap2solar(map, dir)
}
\arguments{
\item{mat}{A matrix of genotypes or genotypes as covariates to be exported.}

\item{dir}{A character with path where SOLAR files to be created.}

\item{nGTypes}{Logical, whether a column \code{nGTypes} to be added to snp.genocov file.
The default value is FALSE.}

\item{out}{(optional) A list, that contains the names for snp.genocov and snp.geno-list files.
   This argument is internally used in \code{solarAssoc} function.}

\item{map}{A data frame with annotation (map) information for SNPs.}
}
\description{
A list of functions allows to pass SNPs data from R to SOLAR.
}
\details{
\code{snpdata2solar} function (1) exports the data set of genotypes stored
in \code{mat} itto SOLAR files, (2) runs solar command `snp load solar.gen`
to check the data is loaded ok; (3) if two output files were not created,
throws an error.

\code{snpcovdata2solar} function emulates the `snp load` SOLAR command.
Two output files are produced: `snp.genocov` and `snp.geno-list`.
The steps are the following: (1) add prefix `snp_` to SNP names;
(2) (optional) compute stats on # genotyped individuals (columns `nGTypes`);
(3) write data and metadata into files.

\code{snpmap2solar} function (1) separates data by chromosome;
(2) write the table into SOLAR map file;
(3) check if the map file is OK by running SOLAR command \code{load map -basepair <filename>}
}
\note{
In association analysis (\code{soalrAssoc} function)
the step of loading SNP maps is skipped.
It seems that SOLAR does not use this information when doing association.
}
\examples{
# Example of `snp.genocov` file:
# id,nGTypes,snp_s1,snp_s2,...
# 1,50,0,0,...
# 2,50,0,0,...

# Example of `snp.geno-list` file:
# snp_s1
# snp_s2
# ...
}

