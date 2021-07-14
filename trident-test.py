import libnfs

target = 'nfs://10.253.15.10/tmp/hack.txt'

print("Trident Test using " + target, flush=True)
print("Output:", flush=True)
print(libnfs.open(target, mode='r').read(), flush=True)