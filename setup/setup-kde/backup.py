import re, os, shutil


with open('filelist.txt', 'r') as f:
    for i in f.readlines():
        if i.startswith('#'):
            continue
        i = i.strip()
        o = re.sub('(^~\/)|(^\/)', '', i)
        print(f'cp {i} {o}')
        os.makedirs(os.path.dirname(o), exist_ok=True)
        shutil.copyfile(os.path.expanduser(i), o)
