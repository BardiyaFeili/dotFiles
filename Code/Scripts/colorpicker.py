with open('/home/bardiya/.cache/wal/colors') as file:
    colors = file.readlines()

with open('/home/bardiya/.cache/wal/wal') as file:
    wp = file.read()

with open('/home/bardiya/.cache/wal/hyprcolors.conf', 'w') as file:
    file.write('')

with open('/home/bardiya/.cache/wal/hyprcolors.conf', 'a') as file:
    for i in range(16):
        file.write(f'$color{i} = {colors[i][1:]}')
    file.write(f'$wp = {wp}')
