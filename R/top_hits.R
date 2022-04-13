#' Extracts top hits (genes/proteins) based on the normalized score
#' 
#' This function extracts the top hits (genes/proteins) based on the normalized score 
#' which is the percentile rank using an adjustable cutoff 
#'
#' @param df dataframe that contains ranked genes/proteins
#' @param prec_cutoff the percentile cutoff  
#' @param omic_type name of omic dataset (eg. RNA, Protein, Kinase, ... etc) 
#'
#' @return dataframe of the top hits 
#' 
#' @export
#'
#' @examples
#' TRUE
#' 

top_hits <- function(df, prec_cutoff, omic_type) {
  
  df %>% 
    dplyr::filter(score >= prec_cutoff) %>% 
    dplyr::ungroup() %>% 
    dplyr::mutate(
      rank = 1:base::nrow(.),
      prize = score,
      type = omic_type
    ) %>% 
    dplyr::select(name, prize, type)
  
}