FILENAME=TARGET-FILE

make:
	make clean	
	xelatex --synctex=1 --shell-escape ${FILENAME}.tex --output-format=pdf
	xelatex --synctex=1 --shell-escape ${FILENAME}.tex --output-format=pdf
	bibtex ${FILENAME}
	makeglossaries ${FILENAME}
	xelatex --synctex=1 --shell-escape ${FILENAME}.tex --output-format=pdf
	xelatex --synctex=1 --shell-escape ${FILENAME}.tex --output-format=pdf
	make clean
	make read

clean:
	rubber --clean -v ${FILENAME}

read:
	evince ${FILENAME}.pdf &

