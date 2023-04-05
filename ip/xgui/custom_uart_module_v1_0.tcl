# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BASE_FREQUENCY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BAUDRATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PARITY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STOPBITS" -parent ${Page_0}


}

proc update_PARAM_VALUE.BASE_FREQUENCY { PARAM_VALUE.BASE_FREQUENCY } {
	# Procedure called to update BASE_FREQUENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BASE_FREQUENCY { PARAM_VALUE.BASE_FREQUENCY } {
	# Procedure called to validate BASE_FREQUENCY
	return true
}

proc update_PARAM_VALUE.BAUDRATE { PARAM_VALUE.BAUDRATE } {
	# Procedure called to update BAUDRATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BAUDRATE { PARAM_VALUE.BAUDRATE } {
	# Procedure called to validate BAUDRATE
	return true
}

proc update_PARAM_VALUE.DATA_LENGTH { PARAM_VALUE.DATA_LENGTH } {
	# Procedure called to update DATA_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_LENGTH { PARAM_VALUE.DATA_LENGTH } {
	# Procedure called to validate DATA_LENGTH
	return true
}

proc update_PARAM_VALUE.PARITY { PARAM_VALUE.PARITY } {
	# Procedure called to update PARITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PARITY { PARAM_VALUE.PARITY } {
	# Procedure called to validate PARITY
	return true
}

proc update_PARAM_VALUE.STOPBITS { PARAM_VALUE.STOPBITS } {
	# Procedure called to update STOPBITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STOPBITS { PARAM_VALUE.STOPBITS } {
	# Procedure called to validate STOPBITS
	return true
}


proc update_MODELPARAM_VALUE.BASE_FREQUENCY { MODELPARAM_VALUE.BASE_FREQUENCY PARAM_VALUE.BASE_FREQUENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BASE_FREQUENCY}] ${MODELPARAM_VALUE.BASE_FREQUENCY}
}

proc update_MODELPARAM_VALUE.BAUDRATE { MODELPARAM_VALUE.BAUDRATE PARAM_VALUE.BAUDRATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BAUDRATE}] ${MODELPARAM_VALUE.BAUDRATE}
}

proc update_MODELPARAM_VALUE.DATA_LENGTH { MODELPARAM_VALUE.DATA_LENGTH PARAM_VALUE.DATA_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_LENGTH}] ${MODELPARAM_VALUE.DATA_LENGTH}
}

proc update_MODELPARAM_VALUE.STOPBITS { MODELPARAM_VALUE.STOPBITS PARAM_VALUE.STOPBITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STOPBITS}] ${MODELPARAM_VALUE.STOPBITS}
}

proc update_MODELPARAM_VALUE.PARITY { MODELPARAM_VALUE.PARITY PARAM_VALUE.PARITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PARITY}] ${MODELPARAM_VALUE.PARITY}
}

