import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

	curkey = None
	total = 0


	##
	## cada linea de texto recibida es una
	## entrada clave \tabulador valor
	##
	for line in sys.stdin:
		total+=1
		if total<=6:
			valor, letra, fecha = line.split("\t")
			valor = int(valor)
			fecha=fecha[:-1]
			sys.stdout.write("{}   {}   {}\n".format(letra, fecha, valor))