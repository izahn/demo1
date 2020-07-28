library(tidyr)
library(dplyr)

exd <- read.csv("./subclasses.csv")

exd$id <- 1:nrow(exd)
exd <- separate_rows(exd, focal_usclass, sep = " \\| ")
exd$dummy <- 1
exd <- pivot_wider(
    exd, id,
    names_from = "focal_usclass",
    values_from = dummy,
    values_fill = 0
)

exd2 <- exd[, "id", drop = FALSE]
exd2$dummy <- lapply(exd[, -1], unlist)

write.csv(exd, "subclasses_dummycodes.csv", row.names = FALSE)

 tibble(lapply(seq_len(nrow(subclasses3)), function(i) subclasses3[i,]))
