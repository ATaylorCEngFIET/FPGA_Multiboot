connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Arty A7-100T 210319A92B5BA" && level==0} -index 0
fpga -file C:/hdl_projects/fpga_multiboot/fpga_multiboot.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Arty A7-100T 210319A92B5BA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Arty A7-100T 210319A92B5BA"} -index 0
dow C:/hdl_projects/fpga_multiboot/fpga_multiboot.sdk/golden/Debug/golden.elf
bpadd -addr &main
