# Set this to the prefix of the notebook name:
%env LAB_PREFIX=lab1
# When you're ready to export, set this to 1 and run this cell:
%env GENERATE_PDF=0
# ===================================================================
![[ $GENERATE_PDF -eq 1 ]] && echo "Please wait..." && fc-cache -f  && \
rm -rf "/tmp/.pdf-gen" && mkdir -p "/tmp/.pdf-gen" && cp -a . "/tmp/.pdf-gen" && \
pushd "/tmp/.pdf-gen" 1>/dev/null && jupyter nbconvert "$LAB_PREFIX.ipynb" --to latex  && \
echo "Converting [1/3]..."  && \
xelatex -interaction=batchmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>/dev/null  && \
echo "Converting [2/3]..."  && \
xelatex -interaction=batchmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>/dev/null  && \
echo "Converting [3/3]..."  && \
xelatex -interaction=batchmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>/dev/null  && \
popd 1>/dev/null && cp -f "/tmp/.pdf-gen/$LAB_PREFIX.pdf" . && rm -rf "/tmp/.pdf-gen" && \
echo "All done. Please refresh your file list and download the PDF file."