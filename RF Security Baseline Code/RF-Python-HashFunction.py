import hashlib
def join_two_strings(filename, B):
    BLOCKSIZE = 65536
    hasher = hashlib.sha3_512(b'')
    with open(filename, 'rb') as afile:
        buf = afile.read(BLOCKSIZE)
        while len(buf) > 0:
            hasher.update(buf)
            buf = afile.read(BLOCKSIZE)
        x = hasher.hexdigest()
        A = x.upper()
    return x