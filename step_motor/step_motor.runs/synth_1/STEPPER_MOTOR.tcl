# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/basys3_demo_board/VHDL_projeleri/step_motor/step_motor/step_motor.cache/wt [current_project]
set_property parent.project_path C:/basys3_demo_board/VHDL_projeleri/step_motor/step_motor/step_motor.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib C:/basys3_demo_board/VHDL_projeleri/step_motor/step_motor/step_motor.srcs/sources_1/new/step_motor.vhd
read_xdc C:/basys3_demo_board/VHDL_projeleri/step_motor/step_motor/step_motor.srcs/constrs_1/new/step_motor_constraints.xdc
set_property used_in_implementation false [get_files C:/basys3_demo_board/VHDL_projeleri/step_motor/step_motor/step_motor.srcs/constrs_1/new/step_motor_constraints.xdc]

synth_design -top STEPPER_MOTOR -part xc7a35tcpg236-1
write_checkpoint -noxdef STEPPER_MOTOR.dcp
catch { report_utilization -file STEPPER_MOTOR_utilization_synth.rpt -pb STEPPER_MOTOR_utilization_synth.pb }