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
		fecha = splits[1]
		mes = fecha.split("-")[1]
		print(mes + '	' + '1')