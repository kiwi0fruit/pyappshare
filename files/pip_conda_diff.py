import os
import re

folder = os.environ['envcache']

conda_file = os.path.join(folder, 'conda_list.txt')
pip_file = os.path.join(folder, 'pip_list.txt')
out_file = os.path.join(folder, 'diff_list.txt')

with open(conda_file) as f:
    conda_lines = f.read().splitlines()
with open(pip_file) as f:
    pip_lines = f.read().splitlines()

conda_lines = [re.split(r' *', item) for item in conda_lines if item[0] is not '#']
pip_lines = [item.split('-') for item in pip_lines]

conda_lines = {re.sub('-', '_', s[0].lower()): s[1].lower() for s in conda_lines}
pip_lines = [(s[0].lower(), re.sub(r'(\.tar\..*|\.zip|\.7z)', '', s[1].lower())) for s in pip_lines]

diff_list = []
for s in pip_lines:
    pip_pkg = s[0]
    pip_ver = s[1]
    try:
        conda_ver = conda_lines[pip_pkg]
        if pip_ver == conda_ver:
            pass
        else:
            diff_list.append(pip_pkg + ' pip-' + pip_ver + ' conda-' + conda_ver)
    except KeyError:
        diff_list.append(pip_pkg + ' pip-' + pip_ver + ' conda-none')

diff = '\n'.join(diff_list)
print('')

print(diff)
with open(out_file, "w") as f:
    f.write(diff)
