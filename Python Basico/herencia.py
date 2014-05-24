class Tecnologia(object):
	def __init__(self,nombre):
		self.nombre=nombre
	def vernombre(self):
		kl="nombre de la tecnologia: "
		print (kl,self.nombre)
	def esteejemplo(self):
		print ("este un ej de HERENCIA")	


class Television (Tecnologia):
	def __init__(self,nombre,dt2_enter):
		super(Television,self).__init__(nombre)
		self.dt2_enter=dt2_enter
		self.screen="hd"
		self.tamano=25
	def vtelevi(self):
		print ("la calidad es",self.screen,"el tamano es",self.tamano)	
class Partedetv(Television):
	def __init__(self,nombre,dt2_enter,dato_enter):
		super(Partedetv,self).__init__(nombre,dt2_enter)
		self.dato_enter=dato_enter
		self.botones=5
		self.mhl="SSSIII"
	def vld(self):
		print(self.dato_enter)
		print(self.dt2_enter)
		print(self.tamano*3)
		print(self.botones)
		

gr =Partedetv("SAMSUNG","segunda_clase","tercera_clase")
gr.esteejemplo()
gr.vernombre()
gr.vtelevi()
gr.vld()
