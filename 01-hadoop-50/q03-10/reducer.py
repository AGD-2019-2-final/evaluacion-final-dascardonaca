import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':



    for line in sys.stdin:
        line.strip()
        key, val = line.split("\t")
        val=val[0]
        sys.stdout.write("{},{}\n".format(val, key))