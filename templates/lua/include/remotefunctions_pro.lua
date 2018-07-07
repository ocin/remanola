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

	local LIVEPORT=1
	local STANDALONEPORT=2

        local results={}
	local lp_ports={}
	local responding_out={}

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

	-- Second port should be the standalone port
	local useport=lp_ports[STANDALONEPORT]
	if useport~=nil then
		table.insert(results, { in_ports={useport}, out_ports={useport} })
	end

        return results
end
