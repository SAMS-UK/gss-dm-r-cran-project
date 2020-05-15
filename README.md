# GSS sequences import into LabCollector 
This is a script to convert fasta sequences into csv format so it they can be imported into LabCollector.

To use this code, download it locally or use git to clone it:

```
git clone https://github.com/SAMS-UK/gss-dm-r-cran-project.git
```


## Dependencies

This R code depends on the following libraries:

* [Phylotools](https://github.com/helixcn/phylotools)
* Tidyverse
* [Stringr](https://stringr.tidyverse.org/)

These dependencies can be easily installed in R:

```
library(devtools)
install_github("helixcn/phylotools")
install.packages("tidyverse")
install.packages("stringr") # Install the released version from CRAN
install_github("tidyverse/stringr") # Install the cutting edge development version from GitHub
```

## Data input format

The parameters are defined in Main.R:

* Fasta file path: consider the header needs to contain the Area code, the ID and a marker name. Please use the data folder to copy your fasta file.
```
>PBK_24_cox23
--ATGTGATGCCATTCCTGGAAGATTAAATCAAGCTTCTCTTTTTATTAAAAGGGAGGGAATTTATTATGGTCAATGCAGTGAAATTTGTGGTATTAATCATGGATTTATGCCTATAGTTGTAGAAGCTGTATCTTTACCTAACTATATTAACTGGATTTCGAATAAATTAAGCGAATAAATCTATGAGAATTTCATTTTTTCAATTCACGTTATTAGTTATTGTTTTCATAGTTCTTTTCAAATCTAATTTTCTAAATAATAAAACTTTAAGTAAATTTTTATCTGATTTTTCTAAAAAACTGGATAAATAACGAAAA--ATGATATCTCTCATCCAAATTTCAAAAACAGTGCAACGACATCC
```
The code will also remove the "-" symbol.
* Query URL: this url needs to be generated by your LIMS admin and it will retrieve the possible samples ID to match your sequences.
[URL example](https://lab.sams.ac.uk/extra_modules/query_builder/api/index.php?action=runQuery&uid=1&token=4SYAYpUEBSVkR72xbNq5np0YMOJMeeEy).
* assessor: add the ID of the assessor, e.g "PT1"
* Forward and reverse primer: add the name of the primer. You can check the available primers [here](https://lab.sams.ac.uk/extra_modules/query_builder/api/index.php?action=runQuery&uid=1&token=XR7VQ8KuoctxlLZAO2xpqYxoA6JjhmoQ) or directy in the LIMS.
* Type of sequence: can be "DNA" or "RNA".
* PCR date if available: e.g. "10-05-2020", an emptry string otherwise "".

## Run the script to convert your sequences
Use the defined parameters in Main.R to run the function fasta2LIMS as:
```
source("R/fasta2csv.R")
seq_df <- fasta2LIMS(fasta_file,lims_url,assessor,owner,forward_primer,reverse_primer,type,pcr_date)
```

## Data output

The output is a csv file with the matched subsamples from the LIMS. 
* Output filename is the same as the original with "\_LIMS.csv" at the end. 
* You will see errors if the sequence matches with more than one subsample ID. If this happens, the query that generates the URL needs to be modified, contact your admin to edit it.
* Open the Output file with a text editor to see if most of your sequences were matched with a subsample ID.
* If you are happy with the result. Go to LabCollector and import the csv to the Sequences module.

