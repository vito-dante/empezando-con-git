import random


class MonteCarlo(object):
	"""docstring for MonteCarlo"""
	def __init__(self):
		self.Punto_de_pedido=4
		self.Cantidad_por_pedido=10
		self.inventario_inicial=15
		self.en_el_viaje=0
		self.entrega_ya=0
		self.semana_transcurrida=1
		self.perdida_por_el_viaje=0
		self.interruptor=1
		self.x="VALOR NO ADMITIDO"
		#valores para motos_vendidas y tiempo de llegada
		self.a=1
		self.b=2
		self.c=3
		self.d=4
		self.e=5

	def Motos_vendidas(self):
		# Random float x, 0.0 <= x < 1.0
		aleatorio=random.random()  
		if aleatorio>0.00 and aleatorio<=0.05: 
			return (aleatorio,self.a)
		if aleatorio>0.05 and aleatorio<=0.30: 
			return (aleatorio,self.b)
		if aleatorio>0.30 and aleatorio<=0.65: 
			return (aleatorio,self.c)
		if aleatorio>0.65 and aleatorio<=0.85:
			return (aleatorio,self.d)
		if aleatorio>0.85 and aleatorio<=1:  
			return (aleatorio,self.e)
		else:
			return (self.x)

	def Tiempo_llegada(self):
		aleatorio=random.random()  
		if aleatorio>0.00 and aleatorio<=0.20: 
			return (aleatorio,self.b)
		if aleatorio>0.20 and aleatorio<=0.70: 
			return (aleatorio,self.c)
		if aleatorio>0.70 and aleatorio<=0.90: 
			return (aleatorio,self.d)
		if aleatorio>0.90 and aleatorio<=1:
			return (aleatorio,self.e)
		else:
			return (self.x)

	def Iteracion(self,nro_iteracion):
		inventario=self.inventario_inicial
		vb=self.en_el_viaje
		resultado=0
		for i in range (0,nro_iteracion):
			op=self.Motos_vendidas()
			print (inventario,op[0],op[1])
			#aqui poner un if para que no salgan negativos
			resultado=inventario-op[1]	
			if resultado>=0:
				inventario=inventario-op[1]	
			#Es hora de pedir?
			if inventario<=self.Punto_de_pedido:
				print (inventario,op[0],op[1])
				#ya hay un pedido en camino?
				if vb==self.entrega_ya:
					po=self.Tiempo_llegada()
					vb=po[1]
					if self.interruptor==0:
						inventario=inventario+self.Cantidad_por_pedido	
					self.interruptor=0
				#tiempo
				vb=vb-self.semana_transcurrida
				#if inventario<0:
				#	self.perdida_por_el_viaje=self.perdida_por_el_viaje+inventario
					

			#ya se cumplio el tiempo?
			#if vb==bv:
				
		#print(self.perdida_por_el_viaje)	
			
	
k=MonteCarlo()
k.Iteracion(20)
