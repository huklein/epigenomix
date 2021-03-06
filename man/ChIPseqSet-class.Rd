\name{ChIPseqSet-class}
\Rdversion{1.1}
\docType{class}
\alias{ChIPseqSet-class}
\alias{ChIPseqSet}
\alias{ChIPseqSet,matrix,GRanges-method}
\alias{ChIPseqSet,matrix,GRangesList-method}
\alias{chipVals<-}
\alias{chipVals<-,ChIPseqSet,matrix-method}
\alias{chipVals}
\alias{chipVals,ChIPseqSet-method}
\alias{cpm}
\alias{cpm,ChIPseqSet-method}

\title{Class \code{"ChIPseqSet"}}
\description{
  A class for storing count data obtained from ChIP-seq experiments by
  counting the number of reads lying within regions. The class extends
  \code{\linkS4class{RangedSummarizedExperiment}}.
}

\section{Objects from the Class}{
  Objects can be created by calls of the form
  \code{ChIPseqSet(chipVals=countDataMatrix,
                   rowRanges=genomicRegions,
                   colData=DataFrame(row.names=colnames(countDataMatrix)),
                   ...)}.
  However, one will most likely create a \code{ChIPseqSet} object by
  calling \code{\link{summarizeReads}}.
}

\section{Slots}{
  \describe{
    \item{\code{metadata}:}{An optional \code{list} of arbitrary
      content describing the overall experiment.}
    \item{\code{rowRanges}:}{Object of class \code{"GRanges"} or \code{"GRangesList"}
      containing the genomic regions where the reads were counted.}
    \item{\code{colData}:}{Object of class \code{"DataFrame"}
      containing information on variable values of the samples. Some methods
      require the total library size of each sample stored in a column
      titled totalCounts.}
    \item{\code{assays}:}{Object of class \code{SimpleList} of a
      matrix, named \code{chipVals} containing the read counts 
      per genomic region.}
  }
}

\section{Extends}{
Class \code{"\linkS4class{RangedSummarizedExperiment}"}, directly.
}
\section{Methods}{
  \describe{
    \item{chipVals}{\code{signature(object = "ChIPseqSet")}: Returns the
      matrix with read counts.}
    \item{chipVals<-}{\code{signature(object = "ChIPseqSet", value = "matrix")}:
      Sets the matrix with read counts.}
    \item{cpm}{\code{signature(object = "ChIPseqSet", libSize,
	log2=FALSE, priorCount=0.1)}: Returns
      an object of \code{ChIPseqSet} with read counts standardized by
      library size - counts per million (cpm). If the library size is
      not given, the column sums of the given object are used. Cpm
      values are logarithmized after adding \code{priorCounts},
      if log2 is \code{TRUE}.}
  }
}

\author{
Hans-Ulrich Klein (hklein@broadinstitute.org)
}

\seealso{
\code{\link{summarizeReads}}, \code{\link{normalizeChIP}}
}

\examples{
showClass("ChIPseqSet")
}

\keyword{classes}

