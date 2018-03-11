coefINLA <- function(mod.inla=NULL, palette="Purples", exp=FALSE, labeller=NULL){
  require(ggplot2)
  require(RColorBrewer)

  pal <- brewer.pal(n = 7, name = palette)

  coef_df <- data.frame()
  for(i in 1:nrow(mod.inla$summary.fixed)){

    name <- NULL
    fixed <- NULL
    d <- NULL

    name <- mod.inla$summary.fixed[i,] %>% rownames()
    fixed <- mod.inla$summary.fixed[i,] %>% as.numeric()
    d <- mod.inla$marginals.fixed[[i]] %>% as.data.frame()

    var_df <- data.frame(
      x = d$x,
      y = d$y,
      var = name,
      lower = fixed[3],
      upper = fixed[5],
      med = fixed[4]
    )

    if(exp == TRUE){ #take advantage of exponentiating quantiles
      var_df[,4:6] <- exp(var_df[,4:6])
    }

    coef_df <- rbind(coef_df, var_df)

  }

  if(is.null(labeller)){
    gg <- ggplot(coef_df, aes(x = x, y = y, group = var)) +
      facet_grid(var ~ . , scales = "free_y") +
      geom_vline(xintercept = 0, color = "grey70") +
      geom_line(stat = "identity", color = "grey20") +
      scale_y_continuous(labels = NULL, minor_breaks = NULL) +
      geom_ribbon(data = subset(coef_df, x > lower & x < upper),
                  aes(ymax = y, ymin = 0, x = x),
                  fill = pal[7], colour = NA, alpha = 0.5)  +
      geom_segment(data = coef_df, aes(xend = med, x = med, yend = 0), color = pal[7], lwd = .75) +
      theme_minimal() +
      theme(axis.title.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.y = element_blank(),
            plot.background = element_blank(),
            panel.grid = element_blank()) +
      xlab("") +
      ylab("")
    return(gg)
  } else {
    gg <- ggplot(coef_df, aes(x = x, y = y, group = var)) +
      facet_grid(var ~ . , scales = "free_y", labeller = labeller) +
      geom_vline(xintercept = 0, color = "grey70") +
      geom_line(stat = "identity", color = "grey20") +
      scale_y_continuous(labels = NULL, minor_breaks = NULL) +
      geom_ribbon(data = subset(coef_df, x > lower & x < upper),
                  aes(ymax = y, ymin = 0, x = x),
                  fill = pal[7], colour = NA, alpha = 0.5)  +
      geom_segment(data = coef_df, aes(xend = med, x = med, yend = 0), color = pal[7], lwd = .75) +
      theme_minimal() +
      theme(axis.title.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.y = element_blank(),
            plot.background = element_blank(),
            panel.grid = element_blank()) +
      xlab("") +
      ylab("")
    return(gg)
  }


}
