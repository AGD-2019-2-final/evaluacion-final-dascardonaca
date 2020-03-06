import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		state = ""
		amount = ""

		# process
		line = line.strip()
		splits = line.split(",")
		state = splits[3]
		amount = splits[4]
		print(state + '\t' + amount)