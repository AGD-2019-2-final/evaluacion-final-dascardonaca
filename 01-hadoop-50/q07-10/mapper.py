import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		state = ""


		# process
		line = line.strip()
		splits = line.split("   ")
		letra = splits[0].strip()
		col2 = splits [1].strip()
		valor = splits[2].strip()
		valor= "00000000"+valor
		valor= valor[-7:]
		print(letra + '\t' + valor+ '\t'+col2)