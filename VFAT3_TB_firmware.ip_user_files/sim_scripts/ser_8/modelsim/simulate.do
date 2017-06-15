onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L work -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib work.ser_8 work.glbl

do {wave.do}

view wave
view structure
view signals

do {ser_8.udo}

run -all

quit -force
