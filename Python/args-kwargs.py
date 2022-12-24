def ft(x, y, z):
    print(x, y, z)

# *args
tpl_vec = (1, 0, 1)
ft(*tpl_vec)
# **kwargs
dct_vec = {'x':1, 'y':2, 'z':5}
ft(**dct_vec)
