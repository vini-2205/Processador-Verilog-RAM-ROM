transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/Processador.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/regn.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/ULA.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/F.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/PC.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/barrel.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/ROM.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/RAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/dec3to8.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/moduloW.v}

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Documentos/LAOC/Pratica2 {C:/Users/user/Desktop/Documentos/LAOC/Pratica2/test_pratica2.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  test_pratica2

add wave *
view structure
view signals
run -all
