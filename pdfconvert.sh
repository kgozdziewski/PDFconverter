#!/bin/csh
#
# set GS = `which gs1`
set GS = /usr/bin/gs
set name = "PDFconverter"
#
echo " "
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

if ( -x ${GS} ) then
   echo ""
else
   echo "Brakuje programu ${GS} (ghostscript), konieczne zainstalowanie."
   echo "$name - koniec skryptu."
   echo " "
   exit(1)
endif

if ( -x ${GS} ) then
#   echo ""
else
   echo "Brakuje programu ${GS} (ghostscript), konieczne zainstalowanie."
   echo "$name - koniec skryptu."
   echo " "
   exit(1)
endif

if ($#argv == 0) then
   echo "Podaj parametry: ./pdfconvert.sh [input].pdf [output].pdf [quality] "
   echo "(brakuje nazwy pliku wejściowego i wynikowego)."
   echo "$name - koniec skryptu."   
#   echo "Domyślna jakość przetwarzania tekstu: $QUALITY"
   exit
endif

if ($#argv == 1) then
   echo "Podaj parametry: ./pdfconvert.sh [input].pdf [output].pdf [quality] "
#   echo "Rozmiar pliku wejściowego:" $x "MB"
   echo "(brakuje nazwy pliku wynikowego)"
   echo "$name - koniec skryptu."   
#   echo "Domyślna jakość przetwarzania tekstu: ${QUALITY}"   
   exit
endif

if ($#argv == 2) then
   #echo "Podaj parametry: [input].pdf [output].pdf [quality] "
   if ( ${1} == ${2} ) then
      echo "Plik wynikowy [${2}] byłby nadpisany, podaj inną nazwę, niż [$1]."
      echo "echo "PDFconverter - koniec skryptu.""
      echo " "
      exit(1)
   endif   
endif

if ($#argv == 3) then
   echo "Podaj parametry: ./pdfconvert.sh [input].pdf [output].pdf [quality] "
   set QUALITY=$3
   echo "Jakość przetwarzania zmieniona na: ${QUALITY}"
endif

if ( -e ${1}.pdf ) then
   set sajz = `stat -c '%s' $1.pdf`
   @ x = $sajz / 1024 / 1024
   echo "Rozmiar pliku wejściowego $1.pdf wynosi $x MB"   

else
   echo "Plik źródłowy ${1}.pdf nie istnieje!"
   echo "PDFconverter - koniec skryptu."
   echo " "
   exit(1)
endif
         
echo "Przetwarzanie dokumentu $1.pdf do pliku $2.pdf z jakością [${QUALITY}]"
echo "Proszę czekać ... "
${GS} -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="/${QUALITY}" -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${2}.pdf ${1}.pdf

set sajzw = `stat -c '%s' $2.pdf`
@ y = $sajzw / 1024 / 1024
@ s = $x / $y

echo "Rozmiar pliku wejściowego $x MB, rozmiar pliku wynikowego: $y MB "
echo "Czynnik redukcji rozmiaru pliku $1.pdf wynosi ok. ${s}."
#ls -la $1.pdf
#ls -la $2.pdf
echo "PDFconverter - koniec skryptu."
echo " "
