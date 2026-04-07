options(repos = c(CRAN = "https://cloud.r-project.org"))

install.packages("remotes")

remotes::install_version(
  "BiocManager",
  version = "1.30.27",
  repos = "https://cloud.r-project.org"
)

remotes::install_version(
  "ggplot2",
  version = "4.0.2",
  repos = "https://cloud.r-project.org"
)

remotes::install_version(
  "RColorBrewer",
  version = "1.1-3",
  repos = "https://cloud.r-project.org"
)

BiocManager::install(version = "3.21", ask = FALSE)

BiocManager::install(
  c("ComplexHeatmap", "DESeq2", "IRkernel"),
  ask = FALSE,
  update = FALSE
)
remotes::install_version(
  "ggrepel",
  version = "0.9.8",
  repos = "https://cloud.r-project.org"
)
cat("BiocManager: ", as.character(packageVersion("BiocManager")), "\n", sep = "")
cat("ggplot2: ", as.character(packageVersion("ggplot2")), "\n", sep = "")
cat("RColorBrewer: ", as.character(packageVersion("RColorBrewer")), "\n", sep = "")
cat("ComplexHeatmap: ", as.character(packageVersion("ComplexHeatmap")), "\n", sep = "")
cat("DESeq2: ", as.character(packageVersion("DESeq2")), "\n", sep = "")
cat("IRkernel: ", as.character(packageVersion("IRkernel")), "\n", sep = "")

IRkernel::installspec(
  user = FALSE,
  name = "ir45",
  displayname = "R 4.5.1"
)
