#' Ranks genes/proteins using a percentile ranking for a selected variable
#' 
#' This function ranks genes or proteins using a percentile ranking for a selected variable (for example, fold change or pvalue)
#'
#' @param df dataframe that contains genes/proteins to rank (tidy format)
#' @param symbol column name that contains the gene/protein symbols 
#' @param metric column name to be used as the metric to rank 
#' @param desc boolean, ranking in a descending or ascending order. Default = FALSE
#'
#' @return dataframe with percentile ranking 
#' 
#' @export
#'
#' @examples
#' TRUE

percentile_rank <- function(df, symbol, metric, desc = FALSE) {
  
  df %>% 
    dplyr::filter(!is.na({{ metric }})) %>% 
    dplyr::rename(name = {{ symbol }}) %>% 
    dplyr::distinct(name, .keep_all = T) -> df
  
  if(desc) {
    df <- dplyr::mutate(df, score = dplyr::percent_rank(dplyr::desc(base::abs({{ metric }}))))
  } else {
    df <- dplyr::mutate(df, score = dplyr::percent_rank(base::abs({{ metric }})))
  }

    dplyr::arrange(df, desc(score)) 
    
    
}
