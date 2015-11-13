from scapy.all import *
from ouimeaux.environment import Environment

def blink_front_room_lamp():
	switch =  env.get_switch('Front Room Lamp')
	switch.blink()

def blink_living_room_lamp():
        switch = env.get_switch('Living Room Lamp')
        switch.blink()

def start_wemo_server():
	env.start()
	env.discover(5)
	print "Devices Found... \n"
	print env.list_switches()
	print env.list_motions()

def arp_display(pkt):
    if pkt[ARP].op == 1: #who-has (request)
      if pkt[ARP].psrc == '0.0.0.0': # ARP Probe
        if pkt[ARP].hwsrc == '74:c2:46:b8:13:b3': # Tide
          print "Pushed Tide - Toggling Front Room Lamp"
          blink_front_room_lamp()
        if pkt[ARP].hwsrc == '74:75:48:2f:4b:c0':
          print "Pushed Cottonelle - Toggiling Living Room Lamp"
          blink_living_room_lamp()
        else:
          print "ARP Probe from unknown device: " + pkt[ARP].hwsrc

env = Environment()
start_wemo_server()
env.wait(15)

print "Now listening for dash buttons.\n"

print sniff(prn=arp_display, filter="arp", store=0)
