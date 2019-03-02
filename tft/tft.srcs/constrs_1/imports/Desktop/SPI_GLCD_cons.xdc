
# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
	#sw15
	set_property PACKAGE_PIN R2 [get_ports rst]					
        set_property IOSTANDARD LVCMOS33 [get_ports rst]
        
   #Sch name = JB8
        set_property PACKAGE_PIN A17 [get_ports clk_out]                    
            set_property IOSTANDARD LVCMOS33 [get_ports clk_out]     
            

            #Sch name = JB1
            set_property PACKAGE_PIN A14 [get_ports spi_ce]                    
                set_property IOSTANDARD LVCMOS33 [get_ports spi_ce]
            #Sch name = JB2
            set_property PACKAGE_PIN A16 [get_ports d_c]                    
                set_property IOSTANDARD LVCMOS33 [get_ports d_c]
            #Sch name = JB3
            set_property PACKAGE_PIN B15 [get_ports rst_lcd]                    
                set_property IOSTANDARD LVCMOS33 [get_ports rst_lcd]
            #Sch name = JB4
            set_property PACKAGE_PIN B16 [get_ports spi_data_out]                    
                set_property IOSTANDARD LVCMOS33 [get_ports spi_data_out]
            #Sch name = JB7
            set_property PACKAGE_PIN A15 [get_ports spi_clk]                    
                set_property IOSTANDARD LVCMOS33 [get_ports spi_clk]         