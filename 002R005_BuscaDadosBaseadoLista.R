# EXTRACTING INFORMATION FROM A TABLE
# IF YOUR FILE HAS LOTS OF COLUMNS YOU HAVE TO SPLIT IT INTO DIFFERENT TABLES WITH FEWER COLUMNS
# DON'T USE UNCOMMON CHARACTERS IN COLUMN'S NAMES
# THE COLUMN OF THE TAXA SHOULD BE CALLED Sample
data <- read.csv(file = "../Área de Trabalho/table5.csv", header = TRUE, sep = ";", check.names = TRUE)

# LOAD THE LIST
lista <- read.csv(file = "../Área de Trabalho/list.csv", header = F)
# IF IT'S A PHYLOGENY YOU CAN CREATE A LIST AS FOLLOWS
tree <- read.tree("~/Google Drive/Pesquisa/AfricaSul/Listeria/analise02/03_Phylogenies/Lmonocytogenes/Tree_Source/RAxML_bipartitions.result")
taxa <- tree$tip.label
write.csv(taxa, file="~/Desktop/taxa.csv")
lista <- read.csv(file="~/Desktop/taxa.csv", header=TRUE,sep=",")


# Busca a coluna Sample em data e compara com a coluna V1 em lista
# EVITAR COLUNAS COM SIMBOLOS ESTRANHOS
p <- subset(data, Sample %in% lista$V1)

# Deixar o resultado na mesma ordem da lista
p <- p[match(lista$V1, p$Sample),]

write.table(p, file = "../Área de Trabalho/essa.csv", quote = FALSE, sep = ",", na
            = "NA", dec = ".")
