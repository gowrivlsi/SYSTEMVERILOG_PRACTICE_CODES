# ================= Project Settings =================
TOP      = full_adder_top.sv
TB       = full_adder_tb.sv
WORKLIB  = work



SV_FILES = \
    full_adder_top.sv\
    full_adder_dut.sv \
    full_adder_intf.sv \
    full_adder_packet.sv \
    full_adder_gen.sv \
    full_adder_bfm.sv \
    full_adder_driv.sv \
    full_adder_imoni.sv \
    full_adder_omoni.sv \
    full_adder_sb.sv \
    full_adder_env.sv \
    full_adder_tb.sv 
    
# ================= Targets =================
all: clean compile simulate

compile:
	vlib $(WORKLIB)
	vlog -sv $(SV_FILES)

simulate:
	vsim -c $(TOP) -do "run -all; quit"

clean:
	rm -rf $(WORKLIB) transcript vsim.wlf

