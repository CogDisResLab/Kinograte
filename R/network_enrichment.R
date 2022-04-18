#' Network pathway analysis
#' 
#' This function performs pathway enrichment analysis on the intergated network
#'
#' @param network integrated network 
#' @param ... arguments passed to PCSF::enrichment_analysis()
#' 
#' @return df enriched terms
#' 
#' @export
#'


network_enrichment <- function(network, ...) {
  
  enrich_res <- suppressWarnings(PCSF::enrichment_analysis(network, ...))
  
  
  enrich_res_df <- enrich_res$enrichment %>% 
    dplyr::mutate_at(c("P.value", "Adjusted.P.value", "Combined.Score"), as.numeric)

  
  num_clusters <- base::unique(enrich_res_df$Cluster)
  
  enrich_res_df <- dplyr::select(enrich_res_df, Cluster,
                         Term, Overlap, P.value, Adjusted.P.value, 
                         Combined.Score, Genes) %>% 
    dplyr::mutate_if(is.numeric, signif, 3)
  
  
  return(
    list(
      pathways = enrich_res_df,
      cluster = num_clusters
      
    )
  )
  
}