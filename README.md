# estimating Rfgt from ms simulations  
## simulations.sh  
executes the pipe msnsam (or the original ms) | ms2fasta.py  
ms2fasta.py converts the ms'output file into a fasta where the ancestral allele is __A__ and the derived allele is __G__  
  
## plot.R  
uses the results from the estimates located in the **res** subdirectory  
plot the results  

## msnsam  
the coalescent simulator used here is **msnsam**, a modified version of Hudson's **ms**  
Can be found here: https://github.com/rossibarra/msnsam  
 
