# PDFconverter

A C shell script for converting PDF files to a smaller file size (note that the interface is currently in Polish).

cho " "
echo "Skrypt $name redukuje rozmiar pliku PDF, ze zmienną jakością."
echo "(c) Krzysztof Goździewski, v 1.0 (2015-2019)"
echo "Disclaimer: nie odpowiadam za możliwe szkody z powodu użycia programu."
echo " "
echo "Parametry: ./pdfconvert.sh [input].pdf [output].pdf [quality] "
echo "  [input] - prefix (nazwa bez .pdf) pliku źródłowego"
echo "  [output] - prefix (nazwa bez .pdf) pliku wynikowego"
echo "  [quality] - jakość przetwarzania, z listy:"
echo "     screen   (wersja ekranowa, 72 dpi, niska jakość)"
echo "     ebook    (niska jakość, 150 dpi, jakość domyślna, przyzwoita)"
echo "     printer  (wysoka jakość, 300 dpi)"
echo "     prepress (wysoka jakość, pełne odwzorowanie kolorów, 300 dpi)"
echo "     default  (ebbok, jakość wyraźnie lepsza niż [screen])"
set QUALITY="ebook"
echo "  domyślna jakość przetwarzania: ${QUALITY}."   

