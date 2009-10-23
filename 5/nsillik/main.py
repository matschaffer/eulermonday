#!/usr/bin/env python
import sys

def main(argv):
    usage()

    sys.exit(0)

def usage():
    print "%s blah" % (sys.argv[0])

if __name__ == "__main__":
    main(sys.argv)
