onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L fifo_generator_v13_1_2 -L work -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib work.fifo_generator_0 work.glbl

do {wave.do}

view wave
view structure
view signals

do {fifo_generator_0.udo}

run -all

quit -force
