function [energy] = NewEnergy(Node, bytes)

padding = 8; %8 bytes of preamble is typical
TxPower = 16; %MCU transmits as 16dBm
datarate = 100000/8;%100kpbs data rate
idlepower = 0.00345; %idle power measured to be 3.45mW in Simplicity Studio 
awaketime = 5; %Node remains awake for 5 seconds after wakeup; arbitrary value

    Node.energy = Node.energy + (10^((TxPower-30)/10))*(padding + bytes)/datarate + idlepower*awaketime;

energy = Node.energy;
end

