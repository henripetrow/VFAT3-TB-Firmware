onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clk_wiz_0 -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L work -O5 work.clk_wiz_0 work.glbl

do {wave.do}

view wave
view structure
view signals

do {clk_wiz_0.udo}

run -all

endsim

quit -force
