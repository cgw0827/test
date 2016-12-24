#/usr/bin/env python

from twisted.internet import protocol,reactor
from time import ctime

HOST='192.168.199.206'
PORT=21567

class TSClntProtocol(protocol.Protocol):
	def sendData(self):
		data=raw_input('>')
		if data:
			print '...sending %s ...'% data 
			self.transport.write(data)
		else: 
			self.transport.loseConnection()
	def connectionMade(self):
		self.sendData()

	def dataReceived(self,data):
		print data 
		self.sendData()

class TSClntFactory(protocol.ClientFactory):
	protocol=TSClntProtocol 
	clientConnectionLost=clientConnectionFailed=lambda self,connector,reasion:reactor.stop()
reactor.connectTCP(HOST, PORT, TSClntFactory())
reactor.run()
