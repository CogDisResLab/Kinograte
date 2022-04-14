#' an example of RNA differential gene expression data 
#'
#'
#' @format A data frame with 3207 rows and 3 variables:
#' \describe{
#'   \item{Gene name}{Gene Symbols}
#'   \item{LFC}{log2 fold change}
#'   \item{P_Value}{pvalue}
#' }
#'
"rnaseq_example"


#' an example of proteomics data 
#'
#'
#' @format A data frame with 141 rows and 2 variables:
#' \describe{
#'   \item{Gene.Symbol}{Gene Symbols}
#'   \item{LFC}{log2 fold change}
#' }
#'
"proteomics_exmaple"


#' an example of Kinome data 
#'
#'
#' @format A data frame with 234 rows and 2 variables:
#' \describe{
#'   \item{hgnc_symbol}{Gene Symbols of kinases}
#'   \item{score}{normlaized score}
#' }
#'
"kinomics_exmaple"


#' an example of ppi network 
#'
#'
#' @format A data frame with 175205 rows and 3 variables:
#' \describe{
#'   \item{head}{Protein 1}
#'   \item{tail}{Protein 2}
#'   \item{cost}{inverse degree of confidence}
#' }
#'
"ppi_network_example"