library(tools)
library(rlang)
library(phylotools)
library(stringr)

fasta2LIMS <- function(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date){
  # fasta2LIMS finds the match between the fasta 
  # sequences and the GSS subsamples IDs
  # Fasta sequnces name format must be AREACODE_id_MARKER

  # Reading fasta file
  seq_df <- phylotools::read.fasta(fasta_file)
  names(seq_df) <- c("label","sequence")
  
  # Removing gaps
  seq_df$sequence <- str_remove_all(seq_df$sequence,"[-]")
  
  # Reading Query Builder lims_url 
  samples_id_df <- read.csv(lims_url,sep = ";",
                            stringsAsFactors = FALSE,
                            colClasses = c("NULL",NA),
                            col.names = c("counts","SubSampleID"))
  # Reading fasta file
  #seq_df <- read.csv(file=fastacsv, sep="\t",
  #                   stringsAsFactors=FALSE, header = FALSE,
  #                   colClasses=c(NA, NA, "NULL"),
  #                   col.names = c("FastaID","Sequence","NULL"))
  
  # Spliting fasta sequences names by underscore
  sequence_id <- strsplit(seq_df$label,"_")
  
  
  #Empty vector to store Subsamples ID match and markers
  ids <- vector()
  markers <- vector()
  
  mmatch <- FALSE
  #Searching the subsample match in each sequence
  for (row in sequence_id) {
    ID <- grep(paste(row[1],"_",row[2],"-",sep=""), samples_id_df[,1],value=TRUE)
    #Calculating numer of matches
    L <- length(ID)
    if (L==1){
      sampleid <- ID
      marker <- row[3]
      }
    else if (L==0){
      sampleid <- " "
      marker <- " "
      print(paste("Warning: No Subsample ID match found for Sequence ",row[1],"_",row[2],sep=""))
      }
    else if (L>0){
      mmatch <- TRUE
      marker <- " "
      sampleid <- " "
      print(paste("Error: Sequence ",row[1],"_",row[2]," has more than one subsample Id match",sep=""))
      print(ID)
      }
    
    # Storing id and marker found
    ids <- c(ids, sampleid)
    markers <-  c(markers, marker)
  }
  # Adding columns to the sequence data frame
  seq_df$subsample_id <- ids
  seq_df$marker <- markers
  seq_df$owner <-rep(owner,length(ids))
  seq_df$forward_primer <- forward_primer
  seq_df$reverse_primer <- reverse_primer
  seq_df$assessor <- assessor
  seq_df$type <- type
  seq_df$pcr_date <- pcr_date
  
  # Organising columns to export in LIMS
  seq_df <- seq_df[,c(3,1,4,2,5,6,7,8,9,10)]
  
  # LIMS output filename
  if(mmatch){
    print("Warning: One or more of your sequences matched more than one Subsample ID, please check your LIMS url and run this code again.")
  }
  lims_file <- paste(file_path_sans_ext(fasta_file), "_LIMS.csv", sep="")
  write.csv(seq_df, lims_file, row.names = FALSE, quote=FALSE)
  
  print(paste("LIMS sequences saved at: ",lims_file))
  return(seq_df)
}



