onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ila_5 -L xil_defaultlib -L xpm -L work -L unisims_ver -L unimacro_ver -L secureip -O5 work.ila_5 work.glbl

do {wave.do}

view wave
view structure

do {ila_5.udo}

run -all

endsim

quit -force
