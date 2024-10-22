# COLLECTING LISTED SEQUENCES FROM A FASTA FILE

#LOADING LIBRARIES
library(seqinr)

# SETTING A FOLDER
setwd(dir = "../")

# LOAD A FASTA FILE 
fasta <- read.fasta(file = "alignment.fas", whole.header = TRUE)

# LOAD A CSV FILE INCLUDING ONLY THE NAMES OF THE SEQUENCES
list <- read.csv(file = "df.csv", sep = ";", header = FALSE, skip = 0, check.names = TRUE, blank.lines.skip = TRUE)

# JUST TO CHECK IF EVERTHYNG IS OK 
names(fasta) %in% list$V1

# SAVING THE SEQUENCES TO A VARIABLE NAMED CHOSEN
chosen <- fasta[names(fasta) %in% list$V1]
write.fasta(sequences = chosen, names = names(chosen), 
            file.out = "newalignment.fas")
            
