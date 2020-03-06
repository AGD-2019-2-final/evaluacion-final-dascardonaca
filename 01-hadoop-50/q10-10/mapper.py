import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		state = ""

		# process
		line = line.strip()
		splits = line.split(",")
		#print(splits)
		#primer valor es letra
		primervalor = splits[0]
		numero=primervalor.split()[0]
		numero= "0000000"+numero
		numero= numero[-5:]


		primerletra=primervalor.split()[1]
		print(primerletra + '\t'+ numero)
		for i in range(len(splits)):
			if i > 0:
				print(splits[i]+ '\t' + numero)
		
