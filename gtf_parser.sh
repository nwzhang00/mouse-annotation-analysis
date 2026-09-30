gtf=Mus_musculus.GRCm38.75_chr1.gtf

echo "This is the number of genes that are annotated."
grep -v "^#" $gtf | awk -F"\t" '$3=="gene"' | wc -l
## result:
## 2027

echo "This is the breakdown of genes by biotype with the most common type first."
grep -v "^#" $gtf \
 | awk -F"\t" '$3=="gene"' \
 | sed 's/.*gene_biotype "\([^"]*\)".*/\1/' \
 | sort | uniq -c | sort -nr

## result:
##    1240 protein_coding
##     221 pseudogene
##     118 miRNA
##     105 snRNA
##      99 snoRNA
##      89 lincRNA
##      73 antisense
##      31 misc_RNA
##      23 rRNA
##      20 processed_transcript
##       5 sense_intronic
##       2 polymorphic_pseudogene
##       1 sense_overlapping
##
## The counts add up to 2027, which is the check that nothing was lost.
