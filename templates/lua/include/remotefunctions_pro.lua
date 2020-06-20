function match_midi_events(mask,events)
	for i,event in ipairs(events) do
		local res=remote.match_midi(mask,event)
		if res~=nil then
			return true
		end
	end
	return false
end

function remote_probe(manufacturer,model,prober)
	local dev_inq_request={remote.make_midi(MIDI_OUT_DEVICEINQ)}
	local dev_inq_response=string.format("%s %02x 00 ?? ?? ?? ?? ?? ?? f7", MIDI_IN_DEVICEINQ_HEAD, DEVICE_ID)
	local prog_layout_request={remote.make_midi(MIDI_OUT_PROGLAYOUT)}

	local LIVEPORT=1
	local STANDALONEPORT=2

	local results={}
	local lp_ports={}
	local standalone_ports={}

	for outPortIndex = 1,prober.out_ports do
		prober.midi_send_function(outPortIndex,dev_inq_request)
		prober.wait_function(50)
		for inPortIndex = 1,prober.in_ports do
			local events=prober.midi_receive_function(inPortIndex)
			if match_midi_events(dev_inq_response,events) then
				table.insert(lp_ports,outPortIndex)
			end
		end
	end

	for i,portnum in pairs(lp_ports) do
		prober.midi_send_function(portnum,prog_layout_request)
		prober.wait_function(50)
		for j,inportnum in pairs(lp_ports) do
			local events=prober.midi_receive_function(inportnum)

			if match_midi_events(MIDI_IN_PROGLAYOUT_STATUS,events) then
				table.insert(standalone_ports,portnum)
			end
		end
	end

	for i,portnum in pairs(standalone_ports) do
		table.insert(results, { in_ports={portnum}, out_ports={portnum} })
	end

	return results
end
