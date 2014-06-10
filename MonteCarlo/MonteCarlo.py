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
		res=0
		#print (i+1,inventario,op[0],op[1])
		print("  Orden de las columnas ")
		print("Iteracion--Inventario--Nro Demanda--Demanda")
		for i in range (0,nro_iteracion):
			op=self.Motos_vendidas()
			print (i+1,inventario,op[0],op[1])
			#aqui poner un if para que no salgan negativos
			resultado=inventario-op[1]
			#res=resultado+res	
			if resultado>=0:
				inventario=inventario-op[1]	
			#Es hora de pedir?
			if inventario<=self.Punto_de_pedido:
				#ya hay un pedido en camino?
				if vb==self.entrega_ya:
					#solo funciona una vez por defecto es 1==0
					if self.interruptor==0:
						inventario=inventario+self.Cantidad_por_pedido
						print("entrega del pedido , ahora tiene %i"%inventario)
						self.interruptor=1
				if inventario<=self.Punto_de_pedido:
					if vb==self.entrega_ya:
						po=self.Tiempo_llegada()
						vb=po[1]
						print("va a ser pedido por que tiene %i"%inventario)
						print ("Demorara alrededor de %i semanas"%vb)
						print ("------------------------------------")
						self.interruptor=0
					#tiempo
					vb=vb-self.semana_transcurrida

	
k=MonteCarlo()
k.Iteracion(15)







