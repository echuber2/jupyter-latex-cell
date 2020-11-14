# Set this to the prefix of the notebook name:
%env LAB_PREFIX=lab1
# When you're ready to export, set this to 1 and run this cell:
%env GENERATE_PDF=0
# ===================================================================
![[ $GENERATE_PDF -eq 1 ]] && echo "Please wait..." && fc-cache -f  && \
rm -rf "/tmp/.pdf-gen" && mkdir -p "/tmp/.pdf-gen" && cp -a . "/tmp/.pdf-gen" && \
( cd "/tmp/.pdf-gen" && jupyter nbconvert "$LAB_PREFIX.ipynb" --to latex  && \
echo "We attempt three rounds of LaTeX rendering to completely generate your PDF file." && \
echo "If errors occur, the process may quit before three rounds are finished." && \
{ echo "" > "/tmp/.pdf-gen/latex-errors.txt" && echo "Converting [1/3]..."  && \
xelatex -interaction=nonstopmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>>"/tmp/.pdf-gen/latex-errors.txt" && \
echo "Converting [2/3]..."  && \
xelatex -interaction=nonstopmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>>"/tmp/.pdf-gen/latex-errors.txt" && \
echo "Converting [3/3]..."  && \
xelatex -interaction=nonstopmode -output-driver='xdvipdfmx -z3' "$LAB_PREFIX.tex" &>>"/tmp/.pdf-gen/latex-errors.txt" && \
rm -f "/tmp/.pdf-gen/latex-errors.txt" ; } || true ) && ( \
{ [ -f "/tmp/.pdf-gen/latex-errors.txt" ] && cp -f "/tmp/.pdf-gen/latex-errors.txt" . && echo "Errors were logged to latex-errors.txt" ; } ; \
{ [ ! -f "/tmp/.pdf-gen/$LAB_PREFIX.pdf" ] && echo "No PDF was created." ; } ; \
{ [ -f "/tmp/.pdf-gen/$LAB_PREFIX.pdf" ] && cp -f "/tmp/.pdf-gen/$LAB_PREFIX.pdf" . && echo "PDF copied: $LAB_PREFIX.pdf" && \
  { [ -f "/tmp/.pdf-gen/latex-errors.txt" ] && ( echo "The PDF file was partially generated but it may be broken." && \
    echo "Please check the error log and try correcting the LaTeX in your notebook." ) || \
    ( rm -f "latex-errors.txt" ; echo "Please refresh your file list and download the PDF file." ) ; } ; } ) && \
echo "Script finished running."
