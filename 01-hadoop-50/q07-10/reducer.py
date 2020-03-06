import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
	for line in sys.stdin:

		splits = line.split("\t")
		letra=splits[0]
		col2 = splits[2]
		valor = splits[1]
		valor = int(valor)
		valor = str(valor)
		col2= col2[:-2]



		sys.stdout.write("{}   {}   {}\t\n".format(letra, col2, valor))
