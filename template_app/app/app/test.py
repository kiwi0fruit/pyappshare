import os

def test():
    return 'python'

def cli():
    print(os.environ.get('PATH'))
    input("Press Enter to exit.")
