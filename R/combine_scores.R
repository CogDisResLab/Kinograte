#' Combines standardized scores
#' 
#' This function ranks combines standardized scores from each omic ranked dataset
#'
#' @param df_rna dataframe with percentile ranking of RNA features
#' @param df_prot dataframe with percentile ranking of protein features 
#' @param df_kin dataframe with percentile ranking of kinase features 
#' @param tf_kin dataframe with percentile ranking of transcription factor features
#'
#' @return dataframe with combined scores
#' 
#' @export
#'
#' @examples
#' TRUE

combine_scores <- function(df_rna = NULL, df_prot = NULL, df_kin = NULL, tf_kin = NULL) {
  
  base::rbind(df_rna, df_prot, df_kin, tf_kin) %>% 
    dplyr::group_by(name) %>%
    dplyr::top_n(1, abs(prize)) %>% 
    dplyr::ungroup()
  
  
  
}
