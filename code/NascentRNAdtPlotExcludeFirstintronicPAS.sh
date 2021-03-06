#!/bin/bash

#SBATCH --job-name=NascentDTPlotPAS_firstintron
#SBATCH --account=pi-yangili1
#SBATCH --time=24:00:00
#SBATCH --output=NascentDTPlotPAS_firstintron.out
#SBATCH --error=NascentDTPlotPAS_firstintron.err
#SBATCH --partition=bigmem2
#SBATCH --mem=100G
#SBATCH --mail-type=END

#module load Anaconda3
#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env

computeMatrix reference-point -S ../data/NascentRNA/NascentRNAMerged.sort.bw  -R ../data/PAS/APAPAS_GeneLocAnno.5perc_withCHR_ExcludeFirstIntron.bed -b 1000  -a 1000 --transcript_id_designator 4 -out /project2/gilad/briana/apaQTL/data/DTmatrix/NascentRNA_ExcludefirstintronPAS.gz

plotHeatmap --sortRegions descend -m /project2/gilad/briana/apaQTL/data/DTmatrix/NascentRNA_ExcludefirstintronPAS.gz --plotTitle "Nascent RNA at Exclude First Intron PAS" --heatmapHeight 7  --averageTypeSummaryPlot "median" --colorMap YlGnBu --refPointLabel "PAS" -out /project2/gilad/briana/apaQTL/output/dtPlots/NascentRNA_ExcludefirstintronPAS.png
