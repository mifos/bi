#!/usr/bin/python

from glob import glob
from collections import defaultdict
import os.path


all = defaultdict(list)
for f in glob('data/percents/*.csv'):
    with open(f) as fd:
        fstline = fd.readline()
        columns = fstline.split(',')
        columns = [c.strip().replace('"', '') for c in columns]
        for c in columns:
            all[c].append(f)
for (c, files) in sorted(all.items()):
    print '%-50s %s' % (c, ' '.join(sorted(os.path.basename(f) for f in files)))
