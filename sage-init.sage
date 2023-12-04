%colors Linux
#%colors NoColor

def symbolic_matrix(a, m, n=None):
    if n is None:
        n = m
    M = []
    for i in range(1, m+1):
        row = []
        for j in range(1, n+1):
            v = f"{a}{i}{j}"
            var(v)
            row.append(SR(v))
        M.append(row)
    return matrix(M)

# STFU python
import sys
ipython = get_ipython()

def hide_traceback(exc_tuple=None, filename=None, tb_offset=None,
                   exception_only=False, running_compiled_code=False):
    etype, value, tb = sys.exc_info()
    value.__cause__ = None  # suppress chained exceptions
    return ipython._showtraceback(etype, value, ipython.InteractiveTB.get_exception_only(etype, value))

ipython.showtraceback = hide_traceback

