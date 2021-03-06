# methods-ChIPseqSet.R
setGeneric("ChIPseqSet", function(chipVals, rowRanges,
                                  colData = DataFrame(row.names=colnames(chipVals)),
                                  metadata = list(), ...)
           standardGeneric("ChIPseqSet"),
           signature=c("chipVals", "rowRanges"))

setGeneric("chipVals", function(object)
           standardGeneric("chipVals"))

setGeneric("chipVals<-", function(object, value)
           standardGeneric("chipVals<-"))

setGeneric("cpm", function(object, libSize, log2=FALSE, priorCount=0.1)
           standardGeneric("cpm"),
           signature="object")

# methods-MixModel.R
setGeneric("acceptanceRate", function(object)
           standardGeneric("acceptanceRate"))

setGeneric("chains", function(object)
           standardGeneric("chains"))

setGeneric("classification", function(object, method)
           standardGeneric("classification"))

setGeneric("components", function(object)
           standardGeneric("components"))

setGeneric("convergence", function(object)
           standardGeneric("convergence"))

setGeneric("mmData", function(object)
           standardGeneric("mmData"))

setGeneric("listClassificationMethods", function(object)
           standardGeneric("listClassificationMethods"))

setGeneric("weights", function(object)
           standardGeneric("weights"))

# other methods
setGeneric("calculateCrossCorrelation", function(object, shift=c(200, 250, 300), bin=10, 
                                                 mode="none", minReads=10000, chrs=NA, mc.cores=1)
           standardGeneric("calculateCrossCorrelation"),
           signature="object")

setGeneric("bayesMixModel", function(z, normNull=c(), expNeg=c(), expPos=c(), gamNeg=c(), gamPos=c(),
                                     sdNormNullInit=c(), rateExpNegInit=c(), rateExpPosInit=c(),
                                     shapeGamNegInit=c(), scaleGamNegInit=c(), shapeGamPosInit=c(), scaleGamPosInit=c(),
                                     piInit, classificationsInit, dirichletParInit=1, shapeDir=1, scaleDir=1, weightsPrior="FDD", sdAlpha,
                                     shapeNorm0=c(), scaleNorm0=c(), shapeExpNeg0=c(), scaleExpNeg0=c(), shapeExpPos0=c(), scaleExpPos0=c(),
                                     shapeGamNegAlpha0=c(), shapeGamNegBeta0=c(), scaleGamNegAlpha0=c(), scaleGamNegBeta0=c(),
                                     shapeGamPosAlpha0=c(), shapeGamPosBeta0=c(), scaleGamPosAlpha0=c(), scaleGamPosBeta0=c(),
                                     itb, nmc, thin, average="mean", sdShape)
           standardGeneric("bayesMixModel"),
           signature="z")

setGeneric("getAlignmentQuality", function(bamFile, verbose=FALSE, mc.cores=1)
           standardGeneric("getAlignmentQuality"),
           signature="bamFile")

setGeneric("integrateData", function(expr, chipseq, factor, reference)
           standardGeneric("integrateData"))

setGeneric("matchProbeToPromoter", function(probeToTranscript, transcriptToTSS,
                                            promWidth=4000, mode="union", fix="center")
           standardGeneric("matchProbeToPromoter"))

setGeneric("mlMixModel", function(z, normNull=c(), expNeg=c(), expPos=c(),
                                  sdNormNullInit=c(), rateExpNegInit=c(), rateExpPosInit=c(),
                                  piInit=c(), maxIter=500, tol=0.001)
           standardGeneric("mlMixModel"),
           signature="z")

setGeneric("normalizeChIP", function(object, method)
           standardGeneric("normalizeChIP"))

setGeneric("plotChains", function(object, chain, component, itb=1, thin=1, cols, ...)
           standardGeneric("plotChains"))

setGeneric("plotClassification", function(object, method, ...)
           standardGeneric("plotClassification"),
           signature="object")

setGeneric("plotComponents", function(object, density=FALSE, ...)
           standardGeneric("plotComponents"),
           signature="object")

setGeneric("summarizeReads", function(object, regions, summarize)
           standardGeneric("summarizeReads"))
