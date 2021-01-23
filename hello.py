from Crypto.Hash import MD5,SHA1, SHA256, SHA384, SHA512

def Hash_MD5():
    h = MD5.new()
    h.update(b'Cryptography and Blockchain Technology')
    print('MD5: ' + h.hexdigest())

def Hash_SHA1():
    h = SHA1.new()
    h.update(b'Cryptography and Blockchain Technology')
    print('SHA1: ' + h.hexdigest())

def Hash_SHA256():
    h = SHA256.new()
    h.update(b'Cryptography and Blockchain Technology')
    print('SHA256: ' + h.hexdigest())

def Hash_SHA384():
    h = SHA384.new()
    h.update(b'Cryptography and Blockchain Technology')
    print('SHA384: ' + h.hexdigest())

def Hash_SHA512():
    h = SHA512.new()
    h.update(b'Cryptography and Blockchain Technology')
    print('SHA512: ' + h.hexdigest())

Hash_MD5()
Hash_SHA1()
Hash_SHA256()
Hash_SHA384()
Hash_SHA512()