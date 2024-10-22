# COLLECTING LISTED SEQUENCES FROM A FASTA FILE

#LOADING LIBRARIES
library(seqinr)

# SETTING A FOLDER
setwd(dir = "G:/Meu Drive/Pesquisa/2023/HIV/CadeiasSubtipoC/")

# LOAD A FASTA FILE 
fasta <- read.fasta(file = "02_AlinhamentoTrabalho/NA_01_v9_IAV_Transmissions_AlinhamentoFinal.fas", whole.header = TRUE)

# LOAD A CSV FILE INCLUDING ONLY THE NAMES OF THE SEQUENCES
list <- read.csv(file = "06_AnaliseSelecao/02_SLAC/05_AllSwineMenosBrazil/NA/NA_SwinemenosBrazil.csv", sep = ";", header = FALSE, skip = 0, check.names = TRUE, blank.lines.skip = TRUE)

# JUST TO CHECK IF EVERTHYNG IS OK 
names(fasta) %in% list$V1

# SAVING THE SEQUENCES TO A VARIABLE NAMED CHOSEN
chosen <- fasta[names(fasta) %in% list$V1]
write.fasta(sequences = chosen, names = names(chosen), 
            file.out = "06_AnaliseSelecao/02_SLAC/05_AllSwineMenosBrazil/NA/NA_SwinemenosBrazil.fas")
            