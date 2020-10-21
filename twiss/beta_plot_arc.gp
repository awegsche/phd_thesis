set terminal cairolatex pdf standalone size 10cm,5cm font 'cmr, 10'header "\\usepackage{amsmath}\n\\usepackage{siunitx}"
set output "Arc_beta_x.tex"
IP1pos = 2.351936961637767e+04
IP2pos = 1.929230000000001e+02
IP3pos = 3.525207216378218e+03

unset errorbars
set xrange [IP2pos:IP3pos]
set ylabel '$\Delta\Phi\; [\text{mrad}]$' font 'cmr, 8'
#set label 1 "\\textbf{\\textsf{IP5}}" at first 10189.77565, graph 1.05 front center
#set arrow from first 10189.77565, graph 0 to first 10189.77565, graph 1 nohead front lw 2 dt 2 lc rgb "#808080" 
#set label 2 "\\textbf{\\textsf{IP4}}" at first 6857.491433, graph 1.05 front center
set arrow from first IP1pos, graph 0 to first IP1pos, graph 1 nohead front lw 2 dt 2 lc rgb "#808080" 
set key r t width 1.5 opaque box lw 2 lc rgb "#A9A9A9" 
set key spacing 1.5 


unset xtics
#set yrange[-50:50]
#set ytics -60,20,60

GREEN =     "#46C482"
DARKGREEN = "#4682B4"


#set yrange [-3.9:3.9]
#set ytics -30,1,30
#set obj 1 rect at graph 0.75, 0.1 size char 17, char 1.5
set ylabel '$\beta\; [\text{m}]$' font 'cmr, 8'
set xtics
set xlabel '$s$ [m]' font 'cmr, 8'
#set obj 2 rect at first STRONG_SOURCE, graph 0.075 size char 7, char 1.5 front
#set obj 2 fc rgb "#FFFFFF" fillstyle solid 1 noborder
#set label "{\\footnotesize\\textsf{MQ.22R4}}" at first STRONG_SOURCE, graph 0.075 textcolor rgb "#000000" front center font 'cmr,4'
#set label "$l$" at first 7879, first -0.7 textcolor rgb "#000000" front center font 'cmr,4'

#set label 3 "$\\SI{45}{^\\circ} - \\SI{45}{^\\circ} - \\SI{45}{^\\circ}$" at graph 0.75, 0.1 center front

plot \
    './twiss_elements.dat' using 2:3 w lines t "$\\beta$"  lw 5.5 lc rgb DARKGREEN

