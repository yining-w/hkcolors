user <- Sys.getenv("USERNAME")

# Run the function
source(paste0("C:/Users/", user, "/GitHub/hkcolors/01_hkcolors.R"))

# Other libraries
library(grDevices) # for rgb commands in the function
library(ggplot2) # plotting
library(datasets) # sample data sets for plotting

# Call the function we just created

plot <- function() { 
  palettes <- c("rouge", "happytogether", "infernal", "moodforlove", "chungking")
  Orange <- Orange
  for (i in palettes) {
  pal <- hkcolors(n=5, name=i)
  
  Orange$Tree <- factor(Orange$Tree, levels=c(1, 2, 3, 4, 5))
  
  plot <- ggplot(Orange) +
       geom_line(aes(x=age, y=circumference, color=Tree)) +
       scale_color_manual(values=pal) +
       theme_minimal() +
       labs(x="Age", y="Circumference")

  print(plot)
  
  ggsave(paste0("C:/Users/", user, "/GitHub/hkcolors/sample/for md/", i, ".png"))
  
  ggsave(paste0("C:/Users/", user, "/GitHub/hkcolors/sample/", i, ".pdf"))
  }
}
plot()

