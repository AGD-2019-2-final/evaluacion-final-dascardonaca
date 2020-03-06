import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		col1 = ""
		col2 = ""
		col3 = ""

		# process
		line = line.strip()
		splits = line.split("   ")
		col1 = splits[0]
		col3 = splits[2]
		print(col1 + '\t' + '1')