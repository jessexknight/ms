tests:
	for test in test/* ; do \
		cp ms/ms.cls $$test ;\
		cd $$test ;\
		pdflatex main && biber main && pdflatex main && pdflatex main ;\
		rm ms.cls ;\
		cd ../../ ;\
	done

clean:
	texclean .
