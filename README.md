# jupyter-latex-cell
A cell you can run in a Jupyter notebook to help with latex compilation.

On JupyterLab, sometimes people get a server timeout or other bug when trying to export PDFs. Instead, you can add this as a cell at the end of your notebook and run it to compile the PDF.

I wrote it as a single command this why because Jupyter was not reliably echoing the progress messages for a bash magic cell otherwise. However, some people reported that the progress messages were still not showing up. In that case, consider these trade-offs: Version 3 clutters the workspace with temp files more than version 4 does, but with version 3 you can refresh the file list until the temp files go away, and then you know the compilation is truly finished.

