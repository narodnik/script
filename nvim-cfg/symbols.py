# Generate superscript and subscript digraph codes

sup_vals = "⁰¹²³⁴⁵⁶⁷⁸⁹ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻ⁺⁻⁼⁽⁾"
sup_keys = "0123456789abcdefghijklmnoprstuvwxyz+-=()"

sub_vals = "₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎"
sub_keys = "0123456789+-=()"

line = None
for i, (k, v) in enumerate(zip(sup_keys, sup_vals)):
    if i % 8 == 0:
        if line is not None:
            print(line)
        line = "dig"

    line += f" ^{k} {ord(v)}"
print(line)

line = None
for i, (k, v) in enumerate(zip(sub_keys, sub_vals)):
    if i % 8 == 0:
        if line is not None:
            print(line)
        line = "dig"

    line += f" _{k} {ord(v)}"
print(line)


