

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

##sw15
#set_property PACKAGE_PIN R2 [get_ports rst]					
#	set_property IOSTANDARD LVCMOS33 [get_ports rst]

##Sch name = JB1
#set_property PACKAGE_PIN A14 [get_ports sig]					
#	set_property IOSTANDARD LVCMOS33 [get_ports sig]	


#Sch name = JC9
    set_property PACKAGE_PIN P17 [get_ports {echo_pin}]                    
     set_property IOSTANDARD LVCMOS33 [get_ports {echo_pin}]
    #Sch name = JC10
    set_property PACKAGE_PIN R18 [get_ports {trig_pin}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {trig_pin}]	
	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {katot[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[0]}]
set_property PACKAGE_PIN W6 [get_ports {katot[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[1]}]
set_property PACKAGE_PIN U8 [get_ports {katot[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[2]}]
set_property PACKAGE_PIN V8 [get_ports {katot[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[3]}]
set_property PACKAGE_PIN U5 [get_ports {katot[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[4]}]
set_property PACKAGE_PIN V5 [get_ports {katot[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[5]}]
set_property PACKAGE_PIN U7 [get_ports {katot[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[6]}]

set_property PACKAGE_PIN V7 [get_ports {katot[7]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {katot[7]}]

set_property PACKAGE_PIN U2 [get_ports {anot[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anot[0]}]
set_property PACKAGE_PIN U4 [get_ports {anot[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anot[1]}]
set_property PACKAGE_PIN V4 [get_ports {anot[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anot[2]}]
set_property PACKAGE_PIN W4 [get_ports {anot[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anot[3]}]

####Sch name = JB1
##set_property PACKAGE_PIN A14 [get_ports {trig_pin}]					
##	set_property IOSTANDARD LVCMOS33 [get_ports {trig_pin}]
###Sch name = JB2
#set_property PACKAGE_PIN A16 [get_ports {echo_pin}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {echo_pin}]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]