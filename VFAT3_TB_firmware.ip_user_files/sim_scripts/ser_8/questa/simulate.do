onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ser_8_opt

do {wave.do}

view wave
view structure
view signals

do {ser_8.udo}

run -all

quit -force
