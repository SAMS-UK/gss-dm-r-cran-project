#library(devtools)
#install_github("helixcn/phylotools")
#install.packages("tidyverse")
#install.packages("stringr")
#devtools::install_github("tidyverse/stringr")


source("R/fasta2csv.R")

type <- "DNA"
pcr_date <- "2021-04-12 00:00:00"
lims_url <- "https://lab.sams.ac.uk/extra_modules/query_builder/api/index.php?action_qb_api=runQuery&uid=1&token=R57T6aYB3GyyzxcBdGopSjTPHjNv6EwY&type=csv&delimiter=;"
assessor <- "SP1"
owner <- "GS-STAR"

fasta_file <- "data/IDN_cox23_120421.fasta"
forward_primer <- "Cox2_for"
reverse_primer <- "Cox3_rev"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)


fasta_file <- "data/UPA_12APR2021.fasta"
forward_primer <- "p23SrV-f1"
reverse_primer <- "p23SrV-r1"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)


fasta_file <- "data/psbA_12APR2021.fasta"
forward_primer <- "psbA-F"
reverse_primer <- "psbA-R1"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

fasta_file <- "data/COX3_12APR2021.fasta"
forward_primer <- "Kcox3_F3"
reverse_primer <- "Kcox3_R761"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

fasta_file <- "data/COX2_12APR2021.fasta"
forward_primer <- "Kcox2_F71"
reverse_primer <- "Kcox2_R671"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

fasta_file <- "data/IDN_cox1_120421.fasta"
forward_primer <- "COXI43F"
reverse_primer <- "COXI1549R"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

fasta_file <- "data/COB_12APR2021.fasta"
forward_primer <- "CB44F"
reverse_primer <- "CB1006R"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

fasta_file <- "data/ITS_12APR2021.fasta"
forward_primer <- "P1"
reverse_primer <- "G4 "
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

fasta_file <- "data/rbcl_12APR2021.fasta"
forward_primer <- "rbcL_F-7"
reverse_primer <- "R-rbcS start"
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)

