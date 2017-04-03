WORK_PATH=/stor/work/Lambowitz/ref/human_transcriptome
OUT_FILE=$WORK_PATH/transcripts.tsv
python transcript_table.py $WORK_PATH
python tRNA_fai2table.py >> $OUT_FILE
ANTICODON="AlaAGC AlaCGC AlaTGC GlyGCC GlyCCC GlyTCC ProAGG ProCGG ProTGG ThrAGT ThrCGT ThrTGT\
            ValAAC ValCAC ValTAC PheGAA AsnATT AsnGTT LysCTT LysTTT AspGTC GluCTC GluTTC HisGTG\
	        GlnCTG GlnTTG SerAGA SerCGA SerTGA SerACT SerGCT ArgACG ArgCCG ArgTCG ArgCCT ArgTCT LeuAAG\
		    LeuCAG LeuTAG LeuCAA LeuTAA IleAAT IleGAT IleTAT TyrATA TyrGTA CysGCA CysACA TrpCCA\
			Undet??? SupCTA SupTTA"

for ANTI in $(echo $ANTICODON)
do
	echo $ANTI
done | awk '{print $1,$1,$1,"tRNA"}' OFS='\t' >> $OUT_FILE
awk '{print $1,$1,$1,$7}' OFS='\t' /stor/work/Lambowitz/ref/RNASeqConsortium/ercc/ercc.bed >> $OUT_FILE
