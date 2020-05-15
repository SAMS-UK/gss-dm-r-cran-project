#library(devtools)
#install_github("helixcn/phylotools")
#install.packages("tidyverse")
#install.packages("stringr")
#devtools::install_github("tidyverse/stringr")


source("R/fasta2csv.R")

fasta_file <- "data/cox23_msa.txt"
lims_url <- "https://lab.sams.ac.uk/extra_modules/query_builder/api/index.php?action=runQuery&uid=1&token=4SYAYpUEBSVkR72xbNq5np0YMOJMeeEy"
assessor <- "PT1"
owner <- "GS-STAR"
forward_primer <- "Cox2_for"
reverse_primer <- "Cox3_rev"
type <- "DNA"
pcr_date <- ""
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

