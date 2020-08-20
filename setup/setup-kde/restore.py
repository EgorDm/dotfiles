import re, os, shutil


with open('filelist.txt', 'r') as f:
    for i in f.readlines():
        if i.startswith('#'):
            continue
        i = i.strip()
        o = re.sub('(^~\/)|(^\/)', '', i)
        print(f'cp {o} {i}')
        os.makedirs(os.path.expanduser(os.path.dirname(i)), exist_ok=True)
        shutil.copyfile(o, os.path.expanduser(i))
