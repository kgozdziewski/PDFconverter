# PDFconverter

A C shell script for converting PDF files to a smaller file size (note that the interface is currently in Polish).
 
Skrypt redukuje rozmiar pliku PDF, ze zmienną jakością.

Disclaimer: nie odpowiadam za możliwe szkody z powodu użycia programu.

 * Użycie: 
   ./pdfconvert.sh [input].pdf [output].pdf [quality]
   
 * Parametry:
   [input] - prefix (nazwa bez .pdf) pliku źródłowego
   [output] - prefix (nazwa bez .pdf) pliku wynikowego
   [quality] - jakość przetwarzania, z listy
     screen   (wersja ekranowa, 72 dpi, niska jakość)
     ebook    (niska jakość, 150 dpi, jakość domyślna, przyzwoita)
     printer  (wysoka jakość, 300 dpi)
     prepress (wysoka jakość, pełne odwzorowanie kolorów, 300 dpi)
     default  (ebbok, jakość wyraźnie lepsza niż [screen])
     
 * Domyślna jakość przetwarzania: ebook.   

