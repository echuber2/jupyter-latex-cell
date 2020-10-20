# Set this to the prefix of the notebook name:
%env LAB_PREFIX=lab1
# When you're ready to export, set this to 1 and run this cell:
%env GENERATE_PDF=0
# ===================================================================
![[ $GENERATE_PDF -eq 1 ]] && \
echo "Please wait..." && \
rm -f "$LAB_PREFIX.pdf" "$LAB_PREFIX.aux" "$LAB_PREFIX.log" "$LAB_PREFIX.out" "$LAB_PREFIX.tex" "texput.log" && \
fc-cache -f  && \
jupyter nbconvert "$LAB_PREFIX.ipynb" --to latex  && \
echo "Converting [1/3]..."  && \
xelatex -interaction=batchmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>/dev/null  && \
echo "Converting [2/3]..."  && \
xelatex -interaction=batchmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>/dev/null  && \
echo "Converting [3/3]..."  && \
xelatex -interaction=batchmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>/dev/null  && \
rm -f "$LAB_PREFIX.aux" "$LAB_PREFIX.log" "$LAB_PREFIX.out" "$LAB_PREFIX.tex" "texput.log"  && \
echo "All done. Please refresh your file list and download the PDF file."