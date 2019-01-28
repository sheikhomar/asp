import numpy as np
import sympy as sy

from fractions import Fraction
from IPython.display import HTML, display

import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# Show decimal numbers as fractions
# np.set_printoptions(formatter={'all':lambda x: str(Fraction(x).limit_denominator())})

def load_custom_styles(stylesheet='styles.css'):
    with open(stylesheet) as f:
        css = f.read().replace(';', ' !important;')
    display(HTML('<style type="text/css">%s</style>Stylesheet "%s" loaded.'% (css, stylesheet)))

def to_frac(x):
    return str(Fraction(x).limit_denominator())

def to_decimal(numpy_array):
    return [float(el) for el in numpy_array]

def format_vector(vec):
    output = '['
    for i, entry in enumerate(vec):
        if i > 0:
            output += ', '
        output += '{0: .4f}'.format(float(entry))
    output += ']'
    return output