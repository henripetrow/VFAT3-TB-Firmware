onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+dser_8 -L xil_defaultlib -L xpm -L work -L unisims_ver -L unimacro_ver -L secureip -O5 work.dser_8 work.glbl

do {wave.do}

view wave
view structure

do {dser_8.udo}

run -all

endsim

quit -force
