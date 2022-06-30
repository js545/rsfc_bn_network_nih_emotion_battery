# Plot DEP and PTS by Adjusted Slope Estimate

library(dplyr)
library(ggplot2)

df = read.csv('E:/Projects/DevCoG_RSFC_DMN_SN_ECN/Y7_RSN4_6/4_6_hostility_t_individual_estimates.csv')

tiff('F:/DevCoG_DevMIND_RS_fMRI/Results/yeo17_dep_slope.png', units='in', width=5, height=5, res=300)
plot(df$NIH_hostility_t, df$S, 
     main = "Title",
     xlab = "Perceived Hostility T-score",
     ylab = "Adjusted Slope of Salience-Frontoparietal Connectivity",
     ylim = c(-.125, .125))

abline(lm(df$S ~ df$NIH_hostility_t), col = "red")
dev.off()

df %>%
  ggplot(aes(x=NIH_hostility_t, y=S)) +
  xlab('Perceived Hostility T-score')+
  ylab('Residual of Slope in Connectivity Change')+
  geom_point(alpha=.5) +
  geom_smooth(method='lm', se=TRUE)+
  theme(plot.title = element_text(hjust = .5))+
  theme(legend.justification = 'top')+
  theme(axis.text = element_text(face='bold'))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.line = element_line(colour='black'))+
  geom_hline(yintercept=0, linetype='dashed', color='gray')
