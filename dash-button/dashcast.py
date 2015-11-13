from scapy.all import *
import pychromecast
import time

def pause_play_chromecast():
	if cast.media_controller.status.player_state == "PAUSED":
		print "Play/n"
		cast.media_controller.play()
	else:
		print "Pause"
		cast.media_controller.pause()


def init_chromecast():
	pychromecast.get_chromecasts_as_dict().keys()
	global cast
	cast = pychromecast.get_chromecast(friendly_name="Living Room Chromecast")
	print (cast.status)

def arp_display(pkt):
    if pkt[ARP].op == 1: #who-has (request)
      if pkt[ARP].psrc == '0.0.0.0': # ARP Probe
        if pkt[ARP].hwsrc == '74:c2:46:8b:cf:f1': # Bounty
          print "Pushed Bounty - Pause Play Chromecast"
          pause_play_chromecast()
        else:
          print "ARP Probe from unknown device: " + pkt[ARP].hwsrc


init_chromecast()
time.sleep(5)

print sniff(prn=arp_display, filter="arp", store=0)
print "Now listening for dash buttons.\n"