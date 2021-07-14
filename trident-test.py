import libnfs
import os

target = os.environ['NFS_TARGET']

print("Trident Test using " + target, flush=True)
print("Output:", flush=True)
print(libnfs.open(target, mode='r').read(), flush=True)