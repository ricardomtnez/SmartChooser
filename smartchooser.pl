:- encoding(utf8). %Caracteres en español
:-use_module(library(pce)). %Librería para relizarlo en modo gráfico
:-use_module(library(pce_style_item)). %Librería para crear label, buttons, etc. -> Diseño de la interfaz gráfica
main:- %Nombre de la regla que permitirá crear objetos
       new(Menu, dialog('SISTEMA EXPERTO: SMART CHOOSER', size(500, 500))), %Diálogo con su respectivo tamaño
       new(L, label(nombre, 'BIENVENIDO A SMART CHOOSER')), %Etiqueta que muestra el nombre del sistema

       %Creación de variables que van a contener las preguntas y las respuestas
       new(@texto, label(nombre, '¡Responde algunas preguntas y el sistema te dira la computadora que requieres')),
       new(@resp1, label(nombre, '')),

       %Creación del botón salir
       new(Salir, button('SALIR', and(message(Menu, destroy),message(Menu,free)))),
       %Creción de botón para realizar el test con su variable
       new(@boton, button('REALIZAR CONSULTA', message(@prolog, comprar))),

       %Creación del tamaño de cada botón y cada label
       send(Menu, append(L)),new(@btncarrera, button('Opciones')),
       send(Menu, display,L,point(70,20)),
       send(Menu, display,@boton, point(300,150)),
       send(Menu, display,@texto,point(20,100)),
       send(Menu, display,Salir,point(200,200)),
       send(Menu, display,@resp1,point(20,130)),
       send(Menu,open_centered),
       send(@texto,font,font(comic,bold,10)),
       send(L,font,font(comic,bold,20)).

comprar:- computadora(NombreImg),
	%Muestra la imagen de la computadora escogida.
	atom_concat('sistemaexperto_imagenes/', NombreImg, RutaModelo),
	atom_concat(RutaModelo, '.jpg', RutaModeloExtension),
	new(Img, picture('Pienso en...')),
	send(Img, width(345)),
	send(Img, height(585)),
	send(Img, open),
	send(Img, display, new(_, bitmap(RutaModeloExtension))),
	limpiar.
%Si ninguna computadora cumple los requerimientos, mostramos este mensaje :(
comprar:-
	new(Di2, dialog('Error', size(100, 200))),
	new(Lab,label(texto,'¡Lo sentimos!. No contamos con un producto con esas caracteristicas')),

	send(Di2,append(Lab)),
	send(Di2,open_centered),

	limpiar.

%Hipótesis.
%Estructura: marca, modelo, tipo, uso, precio, pulgadas, procesador, tarjeta_video, RAM, SO, HD, USB 2.0, USB 3.0.

%El ! al final indica un corte. Esto es para que una vez que se llegó al resultado correcto, no se sigan evaluando otras hipótesis.

%Laptop
computadora('macbookpro')			:- 	macbookpro, !.
computadora('hp_elitebook')		:- 	hp_elitebook, !.
computadora('lenovo_y50_70')		:- 	lenovo_y50_70, !.                    
computadora('dell_alienware_15_r2'):- 	dell_alienware_15_r2, !.
computadora('toshiba_l55')			:- 	toshiba_l55, !.
computadora('hp_14_af16la')		:- 	hp_14_af16la, !.
computadora('hp_envy14')			:- 	hp_envy14, !.
computadora('ghia_qcn3540')		:- 	ghia_qcn3540, !.
computadora('dell_inspiron_14')	:- 	dell_inspiron_14, !.
computadora('asus_f455la')			:- 	asus_f455la, !.
computadora('lenovo_g40_30')		:- 	lenovo_g40_30, !.
computadora('acer_tmb115')			:- 	acer_tmb115, !.
%computadora('No se encontro un producto que cubra sus necesidades', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A').


%Escritorio
computadora('dell_inspiron_3046'):- dell_inspiron_3046, !.
computadora('ghia_pentium_dual')	:- ghia_pentium_dual, !.
computadora('dell_inspiron_2980'):- dell_inspiron_2980, !.
computadora('lenovo_thinkcentre'):- lenovo_thinkcentre, !.                    
computadora('hp_prodesk_400')	:- hp_prodesk_400, !.
computadora('acer_vx2631g')		:- acer_vx2631g, !.
computadora('lenovo_m53p')		:- lenovo_m53p, !.
computadora('imac')				:- imac, !.
computadora('ghia_ci7_4790')		:- ghia_ci7_4790, !.
computadora('hp_elite_one800')	:- hp_elite_one800, !.

%Reglas que identifican a cada computadora (Se deben poner cosas que diferencíen a un modelo del resto).
%Las que no llevan paréntesis son reglas de clasificación.

%%%%%%%%%%%%%%%%%%%%Escritorio
 dell_inspiron_3046:- 
 			 windows,
             ram4,
             muchoAlmacenamiento,
             monitorP,
             verifica('preguntas_imagenes/dell_inspirion_3046_v1.jpg'),
			 verifica('preguntas_imagenes/dell_inspirion_3046_v2.jpg').
             			 

ghia_pentium_dual:- 
 			  linux,
			  verifica('preguntas_imagenes/ghia_pentium_dual_v1.jpg'),
			  ram4,
			  monitorG,
			  verifica('preguntas_imagenes/ghia_pentium_dual_v2.jpg'),
			  economico.

			
dell_inspiron_2980:- 
 			    windows,
				monitorM,
				verifica('preguntas_imagenes/dell_inspirion_2980_v1.jpg'),
				verifica('preguntas_imagenes/dell_inspirion_2980_v2.jpg'),
				ram2.
               

lenovo_thinkcentre:-
 			   windows,
			   ram4,
			   muchoAlmacenamiento,
			   precioMedio,
			   monitorG,
			   verifica('preguntas_imagenes/lenovo_thinkcentre_v1.jpg').


hp_prodesk_400:- 
 			   windows,
			   ram8,
			   precioMedio,
			   monitorG,
			   verifica('preguntas_imagenes/hp_prodesk_400_v1.jpg'),
			   verifica('preguntas_imagenes/hp_prodesk_400_v2.jpg'),
			   verifica('preguntas_imagenes/hp_prodesk_400_v3.jpg').
			   

acer_vx2631g:- 	
 			  monitorP,
				ram4,
				verifica('preguntas_imagenes/acer_vx2631g_v1.jpg'),
				costoM,
				graficosIntegrados.




lenovo_m53p:- 	
 			  monitorM,
				costoM,
				verifica('preguntas_imagenes/lenovo_m53p_v1.jpg'),
				ram8,
				graficosIntegrados.


imac:- 			
 			  osx,
				monitorG,
				grafica,
				ram16,
				verifica('preguntas_imagenes/imac_v1.jpg'),
				verifica('preguntas_imagenes/imac_v2.jpg').


ghia_ci7_4790:-costoM,
				monitorM,
				grafica,
				ram8,
				gamer,
				verifica('preguntas_imagenes/ghia_ci7_4790_v1.jpg').


hp_elite_one800:- 
 			  	verifica('preguntas_imagenes/hp_elite_one800_v1.jpg'),
				verifica('preguntas_imagenes/hp_elite_one800_v2.jpg'),
				ram8,
				grafica,
				monitorM,
				verifica('preguntas_imagenes/hp_elite_one800_v3.jpg').

%%%%%%%%%%%%%%%%%%%%Laptos
lenovo_g40_30:- laptop,
			intel,
			ram4,
			pantallaP,
            muchoAlmacenamiento.


ghia_qcn3540:- laptop,	
			intel,
			ram4,
			pantallaP,
            muchoAlmacenamiento.


dell_inspiron_14:- laptop,
			intel,
			ram4,
            muchoAlmacenamiento.


hp_14_af16la:- laptop, 
			amd,
			ram6,
            muchoAlmacenamiento.


asus_f455la:- laptop,
			intel,
			ram4,
			pantallaP,
            verifica('preguntas_imagenes/asus_f455la_v1.jpg'),
            noPortable.


hp_elitebook:- laptop,
			intel,
			ram16,
			pantallaP,
            windows.


toshiba_l55:- laptop,
			intel,
			ram8,
			pantallaP,
            verifica('preguntas_imagenes/toshiba_l55_v1.jpg').


lenovo_y50_70:- laptop,
			intel,
			ram8,
			pantallaP,
            gamer.

dell_alienware_15_r2:- laptop,
			ram8,


			intel,
			verifica('preguntas_imagenes/dell_alienware_15_r2_v1.jpg'),
			gamer,
			noPortable,
			muyCara.

hp_envy14:- laptop,
			windows,
			verifica('preguntas_imagenes/hp_envy14_v1.jpg'),
			muchoAlmacenamiento,
			pantallaG,
			verifica('preguntas_imagenes/hp_envy14_v2.jpg').


acer_tmb115:- laptop,
			linux,
			pantallaP,
			economico.


macbookpro:- laptop,
			osx,
			ram16,
			intel,
			ssd,
			pocoAlmacenamiento,
			muyCara.
			

			   
%Reglas de clasificación (son como características genéricas que pueden tener varios modelos).
%Se puede poner varias veces la misma regla con distinto parámetro en verifica().
%Se puede poner Más de una condición en cada regla, separándolas por comas.
%escritorio:- 			verifica('preguntas_imagenes/escritorio.jpg').
costoM:- 				verifica('preguntas_imagenes/costoM.jpg').
economico:- 			verifica('preguntas_imagenes/economico.jpg').
gamer:-					verifica('preguntas_imagenes/gamer.jpg').
grafica:- 				verifica('preguntas_imagenes/grafica.jpg').
graficosIntegrados:- 	verifica('preguntas_imagenes/graficosintegrados.jpg').
laptop:- 				verifica('preguntas_imagenes/laptop.jpg').
linux:-					verifica('preguntas_imagenes/linux.jpg').
monitorG:- 				verifica('preguntas_imagenes/monitorG.jpg').
monitorM:- 				verifica('preguntas_imagenes/monitorM.jpg').
monitorP:- 				verifica('preguntas_imagenes/monitorP.jpg').
muchoAlmacenamiento:- 	verifica('preguntas_imagenes/muchoAlmacenamiento.jpg').
muyCara:-				verifica('preguntas_imagenes/muyCara.jpg').
noPortable:-			verifica('preguntas_imagenes/noPortable.jpg').
osx:-					verifica('preguntas_imagenes/osx.jpg').
pantallaG:- 			verifica('preguntas_imagenes/pantallaG.jpg').
pantallaP:-				verifica('preguntas_imagenes/pantallaP.jpg').
pocoAlmacenamiento:-	verifica('preguntas_imagenes/pocoAlmacenamiento.jpg').


ram2:-                  verifica('preguntas_imagenes/ram2.jpg').
ram4:-					verifica('preguntas_imagenes/ram4.jpg').
ram6:-					verifica('preguntas_imagenes/ram6.jpg').
ram8:-					verifica('preguntas_imagenes/ram8.jpg').
ram16:-					verifica('preguntas_imagenes/ram16.jpg').
precioMedio:-			verifica('preguntas_imagenes/precioMedio.jpg').
intel:-					verifica('preguntas_imagenes/intel.jpg').
amd:-					verifica('preguntas_imagenes/amd.jpg').
ssd:-					verifica('preguntas_imagenes/ssd.jpg').
windows:- 				verifica('preguntas_imagenes/windows.jpg').


:- dynamic si/1, no/1. %Propio de prolog que solo permite considerar "SI" o "NO"

%Método que carga en el diálogo la imagen de la pregunta
imagen_pregunta(Ventana, Imagen):-new(Figura, figure),
                                  new(Bitmap, bitmap(Imagen)),
								  send(Bitmap, name, 1),
								  send(Figura, display, Bitmap),
								  send(Figura, status, 1),
								  send(Ventana, display, Figura, point(300, 300)).

%Preguntas al usuario.
pregunta(Caracteristica):- new(Di, dialog('TEST DE PREGUNTAS', size(500, 500))),

imagen_pregunta(Di, Caracteristica),
%Creación de los botones Si/No
new(B1,button(si,and(message(Di,return,si)))),
new(B2,button(no,and(message(Di,return,no)))),


send(Di,append(B1)),
send(Di,append(B2)),

send(Di,default_button,si),
send(Di,open_centered),get(Di,confirm,Answer),
write(Answer),send(Di,destroy),

%Aquí se pregunta si o no al programa
( (Answer == si ; Answer == s)
		->
			assert(si(Caracteristica));
			assert(no(Caracteristica)), fail).

verifica(R):-(si(R) -> true; (no(R) -> fail; pregunta(R))).
%Aquí se limpiará en caso de darle salir
limpiar:-retract(si(_)),fail.
limpiar:-retract(no(_)),fail.
limpiar.


