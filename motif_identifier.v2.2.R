##author: Dustin Wcisel
## 5/1/2014
#############################################
################SYNOPSIS#####################
#############################################
#this script takes in a multi-fasta file, and returns
#a .csv file of whatever motif you've searched.
#############################################
#############################################
#############################################
rm(list=ls())
library(seqinr)
##############################################
###########CONFIGURE SETTINGS#################
##############################################
working_dir <- "C:/Users/Dustin/Desktop" #where to get fasta file to test, and store csv file
motif <- "GG.{14,20}GG" #ITAM = "Y.{2}L.{6,12}Y.{2}[LVI]", ITIM = "[SILV].Y.{2}[ILV]"
csv_filename <- "24554_motif_identiier_output.csv"
fasta_file <- "24553.fasta"
##############################################
##############################################
##############################################

setwd(working_dir) #location of the input/output file

#read in sequences as a seqinr object
fasta <- read.fasta(fasta_file, seqtype= "AA", as.string = TRUE) ## reads in AA fasta file

#initialize empty vectors which will hold the output of the for loops below
name <- NULL
motif_found <- NULL
temp <- NULL

##this loop will fail if a given sequence contains more than 10 instances of the motif (not likely to happen)
for(j in 1:length(fasta)){
  hit <- gregexpr(motif, fasta[[j]][1])
  if (hit[[1]][[1]]==-1) { ## -1 in hit means motif wasn't found in this sequence
    name <- append(name, attr(fasta[[j]], "name"))
    motif_found <- append(motif_found, rep(NA, 10)) #fills motif_found with 10 NAs
      }else{
  for (i in 1:length(attr(hit[[1]], "match.length"))){ #loops around for the possibility of multiple hits
    temp <- append(temp, substr(fasta[[j]][1],hit[[1]][[i]], hit[[1]][[i]]+attr(hit[[1]], "match.length")[[i]]-1))
    #print(paste("length of temp = ", length(temp), "on iteration =", i)) #handy for troubleshooting
    }
  name <- append(name, attr(fasta[[j]], "name"))
  temp <- append(temp, rep(NA, 10-length(temp))) #fill motif_found first with found motifs, then up to 10 "motif not found"s
  motif_found <- append(motif_found, temp)
  temp <- NULL #reset temp each time
  }
}

##auto-populate a matrix with first column = names of sequences and columns 1-10 = motif_found
mat <- matrix(name)
mat2 <- matrix(nrow = length(mat), ncol = 11)

mat2[,1] <- mat[,1]
x <- 10
y <- 1
for (h in 1:length(mat)){
mat2[h,2:11] <- motif_found[y:x]
x<- x+10
y<-y+10
}

write.csv(mat2, file = csv_filename)
