set terminal cairolatex pdf standalone size 8cm,5cm font 'cmr, 10'header "\\usepackage{amsmath}\n\\usepackage{siunitx}"
set output "particle_traj_beta_1.tex"
#set multiplot layout 3,1 rowsfirst

TMARGIN = 0.04
BMARGIN = 0.22

P1 = 1.0 - TMARGIN
PLOTHEIGHT = (1.0 - BMARGIN - TMARGIN) 
P2 = P1 - PLOTHEIGHT
STRONG_SOURCE = 7883.59

set tmargin at screen P1
set lmargin at screen 0.15
set bmargin at screen P2

set yrange [-5:7]

beta(x) = (1.9 + sin(x) + 0.3*sin(0.253*x))
beta_pert(x) = x < 2.5*pi ? beta(x) : beta(x) - 0.5 * sin(1.5*(x-2.5*pi))

part(x, phi0) = beta(x) * sin(0.2*x + 0.7*phi0) #+ orb(x)
part_pert(x, phi0) = beta_pert(x) * sin(0.2*x + 0.7*phi0) #+ orb(x)
orb(x) = 0.3*sin(1.8*x) + 0.03*sin(3*x) + 0.02*sin(18*x) - 0.02*sin(9*x)

ORBIT = "#F04040"
OA = "#404040"
PARTCOL = "#4040F0"
ENVEL = "#000000"
BET = "#008000"
BETPERT = "#800000"
ENVTITLE = "envelope = $\\sqrt{2J\\beta}$"
ENVTITLEPERT = "pert. envelope = $\\sqrt{2J\\beta_{pert}}$"

set xrange [0:30]
set xlabel "phase advance"
set ylabel "x [au]"

set key vertical font ",6" samplen 2 width 7 spacing 2

plot \
    0 lc rgb OA lw 1.5 t "design orbit", \
    part(x, 11) lw 2.5  lc rgb PARTCOL t "particle trajectories",\
    abs(beta(x)) lw 4 lc rgb BET t ENVTITLE, \
    -abs(beta(x)) lw 4 lc rgb BET t ""


set output "particle_traj_beta_pert.tex"
plot \
    0 lc rgb OA lw 1.5 t "design orbit", \
    part_pert(x, 11) lw 2.5  lc rgb PARTCOL t "particle trajectories",\
    abs(beta(x)) lw 4 lc rgb BET t ENVTITLE, \
    -abs(beta(x)) lw 4 lc rgb BET t ""
    
set output "particle_traj_beta_pert_wb.tex"
plot \
    0 lc rgb OA lw 1.5 t "design orbit", \
    part_pert(x, 11) lw 2.5  lc rgb PARTCOL t "particle trajectories",\
    abs(beta_pert(x)) lw 4 lc rgb BETPERT t ENVTITLEPERT, \
    -abs(beta_pert(x)) lw 4 lc rgb BETPERT t ""

set output "particle_traj_beta_many.tex"

plot \
    0 lc rgb OA lw 1.5 t "design orbit", \
    part(x, 2)    lc rgb PARTCOL t "", \
    part(x, 3)    lc rgb PARTCOL t "", \
    part(x, 4)   lc rgb PARTCOL t "", \
    part(x, 5)   lc rgb PARTCOL t "", \
    part(x, 6)   lc rgb PARTCOL t "", \
    part(x, 7)   lc rgb PARTCOL t "", \
    part(x, 8)   lc rgb PARTCOL t "", \
    part(x, 9)   lc rgb PARTCOL t "", \
    part(x, 11) lw 2.5  lc rgb PARTCOL t "particle trajectories",\
    abs(beta(x)) lw 4 lc rgb BET t ENVTITLE, \
    -abs(beta(x)) lw 4 lc rgb BET t ""

set output "particle_traj_beta_many_wb.tex"

plot \
    0 lc rgb OA lw 1.5 t "design orbit", \
    part(x, 2)    lc rgb PARTCOL t "", \
    part(x, 3)    lc rgb PARTCOL t "", \
    part(x, 4)   lc rgb PARTCOL t "", \
    part(x, 5)   lc rgb PARTCOL t "", \
    part(x, 6)   lc rgb PARTCOL t "", \
    part(x, 7)   lc rgb PARTCOL t "", \
    part(x, 8)   lc rgb PARTCOL t "", \
    part(x, 9)   lc rgb PARTCOL t "", \
    part(x, 11) lw 2.5  lc rgb PARTCOL t "particle trajectories", \
    abs(beta(x)) lw 4 lc rgb BET t ENVTITLE, \
    -abs(beta(x)) lw 4 lc rgb BET t ""
exit

unset errorbars
set xrange [7300:8500]
set ylabel '$\Delta\Phi\; [\text{mrad}]$' font 'cmr, 8'
#set label 1 "\\textbf{\\textsf{IP5}}" at first 10189.77565, graph 1.05 front center
#set arrow from first 10189.77565, graph 0 to first 10189.77565, graph 1 nohead front lw 2 dt 2 lc rgb "#808080" 
#set label 2 "\\textbf{\\textsf{IP4}}" at first 6857.491433, graph 1.05 front center
#set arrow from first 6857.491433, graph 0 to first 6857.491433, graph 1 nohead front lw 2 dt 2 lc rgb "#808080" 
set key r t width 1.5 opaque box lw 2 lc rgb "#A9A9A9" 
set key spacing 1.5 

# show strong error
set arrow from first STRONG_SOURCE, graph 0 to first STRONG_SOURCE, graph 1 nohead lw 2 dt 1 lc rgb "#228B22"

unset xtics
set yrange[-50:50]
set ytics -60,20,60

GREEN =     "#46C482"
DARKGREEN = "#4682B4"


set yrange [-3.9:3.9]
set ytics -30,1,30
#set obj 1 rect at graph 0.75, 0.1 size char 17, char 1.5
set ylabel '$\Delta\Phi\; [\text{mrad}]$' font 'cmr, 8'
set xtics
set xlabel '$s\; [\text{m}]$' font 'cmr, 8'
set obj 2 rect at first STRONG_SOURCE, graph 0.075 size char 7, char 1.5 front
set obj 2 fc rgb "#FFFFFF" fillstyle solid 1 noborder
set label "{\\footnotesize\\textsf{MQ.22R4}}" at first STRONG_SOURCE, graph 0.075 textcolor rgb "#000000" front center font 'cmr,4'
#set label 3 "$\\SI{45}{^\\circ} - \\SI{45}{^\\circ} - \\SI{45}{^\\circ}$" at graph 0.75, 0.1 center front

plot \
    './../data/sim_ijklx_peak_meas.txt' using 1:(1000*$2):(1000*$3) w linespoints t "$\\Phi^\\text{meas}$" pt 6 ps 0.4 lw 3.5 lc rgb DARKGREEN
unset multiplot
