EXTERNAL Name(charName)
EXTERNAL CharacterIcon(charName)
EXTERNAL Expression(expressionName)
EXTERNAL HideCharacter(charName)
EXTERNAL Background(background)

-> start

=== start ===
~ Background("Forest_Background")
~ Name("___")
Nuestro mundo. El mundo original. El primero de todos. Justo antes de que llegaran ellos… Al fin ha resurgido de sus cenizas. Después de casi 50 mil años, por fin podemos regresar a nuestro hogar.
~ CharacterIcon("v")
V se encontraba cazando en el bosque como de costumbre, pues ese día no tenía nada para comer, cosa que también era habitual en su vida.
Era increíblemente hábil haciendo uso del arco, casi nunca fallaba una flecha. Ese día, atrapó muchas aves, lo que le permitiría comer durante unos días sin tener que preocuparse.
Terminando su jornada, V se dispusó a ir a lo que llamaba su hogar.
Una simple cabaña en un lado del bosque.
Sin embargo, justo cuando empezaba su camino a casa, escuchó unos fuertes aullidos al oeste. /* meter sonido aqui */
~ Name("V")
<i>Esos aullidos... no son animales normales. Alguien podría estar en peligro.</i>
-> aullidos

=== aullidos ===
* Ir a investigar los aullidos -> historia_continua
* Ignorar los sonidos y regresar a casa -> Bad_End_1

=== Bad_End_1 ===
~ Name("___")
~ HideCharacter("v")
~ CharacterIcon("v")
V se detuvo por un momento, pero negó con la cabeza.
~ Name("V")
<i>No me meteré en más problemas hoy. Lo último que necesito es enfrentarme a una manada.</i>
~ Name("___")
 Volvió a su cabaña, cenó en silencio y se acostó, aunque esa noche, el bosque no dejó de crujir y murmurar.
<b>[Al día siguiente…]</b>
V salió temprano a cazar.
Se internó en la misma dirección de los aullidos del día anterior, no por remordimiento, sino porque algo en el aire olía mal.
No tardó en encontrarlo.
 El claro estaba silencioso. Los cuerpos de varios Dant’ir pequeños yacían alrededor. En el centro, un bulto cubierto por una capa gris desgarrada.
V se acercó lentamente.
Cuando apartó la tela, su estómago se revolvió.
Era el cuerpo de un niño. Pálido, mordisqueado, cubierto de heridas. Su rostro seguía mirando al cielo, ojos abiertos, como si aún esperara que alguien viniera a ayudarlo.
~ Name("V")
—…llegué tarde.
~ Name("___")
Por primera vez en años, V no recogió sus presas. Se marchó en silencio, sin volver la vista atrás.
No volvió a dormir bien.
Y nunca sabría la verdad sobre lo que aquel niño era… ni lo que pudo haber cambiado su destino.
<b>Final alternativo desbloqueado: “El cazador que llegó tarde”</b>
#change_scene: Game Over
-> END

=== historia_continua ===
~ Name("___")
Puso rumbo al origen de aquellos sonidos, puesto que ya conocía de sobra de qué se trataba.
~ CharacterIcon("v")
En cuanto llegó a la zona, lo confirmó.
Se trataba de una pequeña manada de Dant’irs, unas criaturas muy temidas en su mundo, los depredadores naturales de los Hek.
V era un cazador experimentado. Evitaba meterse en problemas siempre que podía, pero había algo raro en esos Dant’ir.
Normalmente nunca iban en manada, solamente cuando se disponían a cazar a algún Hek, pero V sabía que el único Hek de la zona era él mismo, por lo que inmediatamente pensó que alguien más había entrado al bosque y se había perdido.

#change_scene: Minigame_shoot

~ Name("___")
~ CharacterIcon("v")
Sin pensárselo dos veces, V empezó a disparar con su arco a aquellas criaturas, derribándolas una por una.
Por suerte, eran pocas y algo débiles, facilitando la tarea. En cuanto todas cayeron, V se acercó a lo que parecía un pequeño niño. 

~ Name("V")
<i> Así que esos monstruos intentaban comerse a este crío. </i>

~ Name("___")
Aquel niño estaba hecho bola en el suelo, cubierto por una capa gris muy desgastada y con marcas de arañazos en ella.
V se dispuso a retirar la capa y comprobar que la criatura se encontraba bien.
Sin embargo, lo que V no se esperaba en aquel momento era encontrarse algo totalmente diferente de un Hek.
Cuando V levantó esa capa, vió a una criatura de piel blanca, sin ninguna marca distintiva, más allá de ser una piel extremadamente lisa, y un cabello negro profundo.
Era raro, porque V nunca había visto nada similar antes.
Con curiosidad, se fijó todavía más en lo que había encontrado.
Lo movió un poco para verlo mejor y pudo observar las similitudes que tenía con un niño Hek corriente. Pero lo que le preocupó no fue solo que el color de piel no coincidía con los de un Hek normal.
No, eso era lo de menos.
Lo que de verdad le preocupaba era no ver ni rastro de alas, cuernos o grandes colmillos en aquella criatura.
Empezó a asustarse, nunca había visto nada igual. No conocía a ninguna criatura similar, pese a todos sus años siendo cazador.
De pronto, se le vino a la cabeza una historia que le contaron cuando era pequeño.
Una sobre unas criaturas con un color de piel muy diferente a los Hek, sin alas y de un tamaño menor a ellos.
Unas criaturas horribles y malvadas que cazaban a los Hek por diversión.
Los humanos.
En cuanto a V se le pasó por la cabeza aquella historia, dudó.
~ Name("V")
<i>Es imposible que sea un humano, ¿verdad?</i>
~ Name("___")
 El niño abre los ojos. Marrones. Sin brillo, pero con una humanidad desconocida.
V duda. 
Sus manos tiemblan. Tiene el arco cargado, la cuerda tensa, la punta de la flecha apuntando a su frente.
~ HideCharacter("v")
-> choice_disparar

=== choice_disparar ===
#timed
* Dispara al niño. -> Bad_End_2
* No dispara -> no_dispara

=== Bad_End_2 ===
~ Name("___")
~ HideCharacter("v")
~ CharacterIcon("v")
V contuvo el aliento. Una imagen le vino a la cabeza: los cuentos de su infancia, las criaturas sin alas, devoradoras de Hek.
Su dedo se aflojó.
La flecha voló.
Rápida. Silenciosa. Precisa.
~ CharacterIcon("kid")
El niño ni siquiera gritó. Solo cayó de espaldas con los ojos muy abiertos. La capa gris se tiñó lentamente de rojo.
~ HideCharacter("kid")
V no se movió durante varios minutos. Luego, se acercó.
El cuerpo era pequeño. Frágil. Nada más que un crío. Ni monstruo, ni asesino. Solo un niño.
~ Name("V")
—No tenía por qué ser así...
~ Name("___")
No lo enterró. No tenía valor.
Simplemente dio media vuelta y se marchó del claro, con una punzada clavada en la nuca que ya no lo abandonaría.
<b>[Días después…]</b>
Algo empezó a moverse en el bosque.
Los Dant’ir se volvieron más violentos. Más organizados.
Rumores de criaturas nunca vistas empezaron a correr por las ciudades.
V ignoró todo eso.
Pero una noche, al regresar a casa, su cabaña estaba ardiendo.
Y desde los árboles…
…alguien lo observaba.
<b>Final alternativo desbloqueado: “El arquero sin fe”</b>
#change_scene: Game Over
-> END

=== no_dispara ===
El niño se puso de pie.
-> historia_continua2

=== historia_continua2 ===
~ CharacterIcon("kid")
~ CharacterIcon("v")
No podía medir más de 110 cm de altura, casi ni le llegaba a la altura de las rodillas a V.
El Hek se puso nervioso, el pulso le temblaba y le costaba apuntar. V pudo ver en la piel del niño numerosos arañazos que sangraban.
Se fijó en su cara.
Estaba sucia y delgada. Tenía los ojos rojizos, como si hubiera estado llorando.
~ Name("V")
<i>¿Qué demonios hace un niño aquí?</i>
~ Name("___")
El niño dio unos pequeños pasos hacía atrás. Las manos juntas a la altura del pecho.
Estaba claramente asustado y V pudo verlo.
Aún tenía dudas, pero bajó su arco y se empezó a acercar poco a poco a aquella criatura.
~ Name("V")
¿Quién eres?
Qué haces aquí tú solo?
~ Name("___")
Pero no hubo respuesta por parte del niño, tan solo unos sonidos vacíos que V no lograba comprender.
El niño cayó de espaldas tras tropezar con una rama y soltó un pequeño grito de dolor. Le brotaron lágrimas de los ojos.
~ Expression("sad")
V se acercó torpemente hacía él, no sabía si sería buena idea tocarlo, pero por todos los demonios, solo era un niño, ¿no?
Así que se arrodilló a su lado y le tendió el brazo. El niño, desconfiado, lo aceptó y se puso de pie.
Efectivamente, apenas le llegaba a las rodillas a V. La pequeña criatura se abrazó fuertemente a la pierna de V y continuó sollozando.
V se planteó apartarlo de su pierna, pero enseguida entendió que tan solo estaba asustado y hambriento.
Aún tenía dudas, pero V agarró al niño de los hombros y lo elevó hasta colocarlo sobre los suyos.
~ Name("V")
<i> Mejor decido en casa...</i>
<i> Una vez este limpio y con la tripa llena, seguro que veo razón.</i>
<i>Tiene que ser un niño Hek, y sus padres estaran buscandolo.</i>
~ Name("___")
Lo que V no sabía, era que aquella decisión le cambiaría la vida por completo.
~ HideCharacter("kid")
~ CharacterIcon("kid")
Pusieron rumbo a casa. V seguía preocupado, no estaba seguro de si eso era buena idea.
~ Background("House2_Background")
La casa de V era muy pequeña. Tenía una sola habitación, dondé se encontraba su cama rellena de hojas y pasto y una pequeña sábana vieja.
ambién había una silla y una mesa de madera redonda y desgastada y lo que parecía una chimenea improvisada con un caldero y una parrilla para asar algo. 
No contaba con baño, pues este se encontraba fuera. V hacía sus necesidades en el propio bosque y se bañaba en una bañera de madera que calentaba el agua como si fuese una olla. Agua que tenía que traer a mano, por lo que no la cambiaba muy a menudo. 
Ambos entraron en casa y el niño parecía desconcertado.
V intentó preguntarle el nombre a la criatura varias veces, pero este no parecía entenderle, por lo que decidió llamarle Somi, igual que se llamaba su madre.
V echó un poco de agua en el caldero y encendió un fuego.
Sacó una de las aves que había cazado antes y la colocó sobre la mesa. Empezó a desplumarla y una vez hecho, arrancó su cabeza con un cuchillo y abrió su vientre para sacarle las tripas.
Somi miró curioso la escena, pero no pareció sorprenderle.
Cuando V tuvo al ave totalmente lista y el agua ya estaba hirviendo, la echó en el caldero sin preocuparse demasiado por sazonarla o por el tiempo de cocinado.
En vez de eso, salió fuera y encendió el fuego de su bañera para calentar el agua. 
Entró de nuevo a casa y le hizo un gesto a Somi para que se acercara.
Este lo siguió y V se agachó. V le quitó la capa con algo de duda y ya pudo ver con claridad su piel.
No había nada más que arañazos en ella.
Ni escamas, ni nada que fuese distintivo de los Hek. Nada. V continuó quitándole la ropa a Somi.
Para los Hek, verse desnudos no significaba nada, era algo totalmente normal, aunque la mayoría prefería llevar algo de ropa, sobre todo por moda y estatus.
El cuerpo de Somi no dejaba de sorprender a V. No tenía nada que ver a como eran los cuerpos de otros niños Hek.
Empezó a preocuparse de nuevo. V no quería aceptarlo, pero él sabía que aquel niño no podía ser un Hek.
Tampoco estaba seguro de que fuera humano, ya que para ellos solo eran cuentos de hadas. 
~ Background("Forest_Background")
V se llevó a Somi fuera.
Comprobó que el agua de la bañera estuviera caliente y agarró a Somi de los hombros para meterlo dentro.
Cogió un trapo, algo sucio, y empezó a limpiar el cuerpo de Somi. Le lavó la sangre, la suciedad y el pelo.
Somi apenas puso resistencia, al contrario.
Parecía feliz y estaba relajado en esa situación.
V terminó de limpiarlo. Lo sacó del agua y lo dejó de pie en el suelo. 
Entró de nuevo a casa y volvió a salir con una tela grande, que utilizó a modo de toalla para secarlo.
~ Background("House2_Background")
Ambos volvieron a entrar a casa.
V se fijó en que Somi parecía tener frío, ya que estaba temblando. Le extrañó. En aquella época no hacía frío.
De hecho, muchos niños Hek iban sin ropa en esas fechas y nunca se les veía tiritando.
V abrió un cajón y sacó de él una camisa marrón algo gastada y se la puso a Somi encima.
Le quedaba enorme, casi parecía un vestido, pero era lo mejor que podía darle en ese momento, ya que la ropa que llevaba Somi estaba destrozada por los arañazos de los Dant’ir. 
~ HideCharacter("kid")
~ HideCharacter("v")
// change scene: food choice
~ CharacterIcon("v")
~ Expression("happyV")
V sonrió, pero inmediatamente apartó esa expresión de su cara.
~ HideCharacter("v")
~ CharacterIcon("v")
~ Name("V")
¿Qué hago sonriendo?
~ Name("___")
Sus dudas no se disipaban, pero tampoco podía dejar a un niño solo en el bosque a esas horas.
Como al día siguiente V tenía que ir al pueblo a hacer unas tareas, aprovecharía para llevar a Somi allí y ver si podía conseguir algo más de información.
Tal vez alguien habría puesto un encargo para encontrar al niño y así V podría sacarse unas monedas. 
~ CharacterIcon("kid")
Somi terminó de comer e inmediatamente soltó un bostezo.
V lo vio y acostó a Somi en la cama. Se quedó dormido casi de inmediato.
V recogió todo y apagó los fuegos. La casa se quedó iluminada gracias a unas pequeñas velas que había en la pared. 
~ HideCharacter("kid")
V volvió a abrir el cajón de la tela y también otro que estaba al lado.
De ese sacó un estuche y lo dejó en la mesa.
Se sentó, estiró la tela y abrió el estuche. Era un estuche de costura. Tenía de todo. Agujas, hilo, tijeras… 
Comenzó a dibujar sobre la tela. Una vez tuvo el dibujo hecho, sacó las tijeras y empezó a cortar siguiendo las líneas con mucho cuidado.
Con los trozos cortados, hiló la aguja y comenzó a coserlos.
Empezó a tomar forma: era una capa nueva para Somi, con capucha y todo.
También le hizo una camisa y unos pantalones, además de unos zapatos muy simples.
No parecían los más cómodos del mundo, pero al menos no se haría daño en los pies al caminar. 
Estuvo toda la noche cosiendo y apenas tuvo tiempo de dormir.
Parecía que a V le encantaba coser y además se le daba bastante bien.
~ CharacterIcon("kid")
Al amanecer, Somi levantó a V de la cama. Parecía que volvía a tener hambre.
V se incorporó. Buscó en un lado del caldero y sacó lo que parecía una fruta.
Se la dio a Somi e hizo el gesto de morderla.
Somi pareció comprenderle y eso hizo. Puso cara rara al probarla, pero se la terminó comiendo entera. 
Una vez desayunados, V le enseñó a Somi la ropa que le había preparado.
~ Expression ("happy")
Somi se la puso. Le quedaba perfecta. Somi sonrió y dio un par de vueltas sobre sí mismo, contento.
~ Expression ("happyV")
A V también se le escapó una sonrisilla.
Somi lo miraba desde una esquina de la cabaña.
Había comido, estaba limpio, y ahora vestía ropa improvisada pero digna.
No hablaba. No entendía. Pero lo seguía con los ojos.
~ HideCharacter("v")
~ CharacterIcon ("v")
V suspiró. 
~ Name("V")
<i>¿Y si no es un niño? ¿Y si todo esto es un error?</i>
<i>Tal vez debería dejarlo aquí... seguir investigando el bosque. No ir al pueblo...</i>
<i>¿Y si me meto en algo peor por ayudarlo?</i>
~ Name("___")
-> choice_dejarlo

=== choice_dejarlo ===
* Llevar al niño contigo al pueblo. -> historia_continua3
* Dejar al niño solo en la cabaña mientras vas a investigar. -> Bad_End_3

=== Bad_End_3 ===
~ Name("___")
~ HideCharacter("v")
~ HideCharacter("kid")
~ CharacterIcon("v")
~ CharacterIcon("kid")
~ Background("House2_Background")
V se agachó, lo miró a los ojos y le dijo en voz baja:
~ Name("V")
—Esperaré a que hables. No puedo arriesgarme aún. Quédate aquí. Volveré.
~ Name("___")
El niño no respondió. Solo bajó la mirada y abrazó sus rodillas.
~ HideCharacter("kid")
~ Background("Forest_Background")
V partió hacia el bosque, buscando información. 
Pero al regresar, unas horas después...
~ Background("House2_Background")
La cabaña estaba abierta.
La cama revuelta.
Pequeñas huellas marcadas en el barro...
Y sangre.
~ Background("Forest_Background")
V siguió el rastro. No era largo. Solo unos pasos más allá, entre los arbustos, encontró restos de ropa. Una tela marrón, rasgada. El cuerpo no estaba.
Solo marcas de garras… y un silencio demasiado limpio.
~ Name("V")
—Te dejé solo…
~ Name("___")
V nunca supo si el niño había sido un monstruo o un milagro.
Solo supo que, al tomar distancia, lo perdió todo.
Y con él… quizás el destino del mundo.
<b>Final alternativo desbloqueado: “El abandono silencioso”</b>
#change_scene: Game Over
-> END

=== historia_continua3 ===
~ HideCharacter("v")
~ HideCharacter("kid")
~ CharacterIcon("kid")
~ CharacterIcon("v")
~ Name("V")
<i> Es mejor llevarlo conmigo...</i>
~ Name("___")
Con ambos listos, V agarró de la mano a Somi y ambos salieron de casa, rumbo al pueblo, conocido como Frisbar. 
~ Background("Forest_Background")
El camino fue sencillo, no hubo contratiempos.
Al ser temprano, apenas había personas, y nadie pareció fijarse en Somi, lo que tranquilizó a V.
Desde la pequeña cabaña hasta la entrada del pueblo habría alrededor de 15 minutos caminando.
Tanto V como Somi iban encapuchados, para no ser reconocidos. 
// bg: town
El pueblo de Frisbar era distinto a cualquier otro.
Sus construcciones estaban entrelazadas con la naturaleza: grandes árboles de más de cincuenta metros de alto formaban el esqueleto del asentamiento, 
y las casas colgaban con gruesas cuerdas y tablones de madera suspendidos entre las ramas, como un enjambre de nidos entre el follaje.
Algunos de los caminos estaban formados por puentes colgantes, y otros por escaleras talladas directamente en los troncos.
Frisbar era una joya escondida en lo alto del bosque, y aunque no era una ciudad rica, sí desprendía una sensación de armonía que pocos pueblos lograban.
V, encapuchado, caminaba con Somi de la mano por las pasarelas elevadas.
Se notaba que hacía tiempo que no pisaba un pueblo.
Saludaba con una inclinación de cabeza a los pocos que lo reconocían, pero mantenía la capucha baja, intentando no llamar la atención.
Somi lo seguía en silencio, observando con ojos muy abiertos las estructuras, 
los animales exóticos en las jaulas colgantes, y a los Hek que caminaban con alas extendidas o cuernos adornados.
El destino era una taberna suspendida entre dos árboles especialmente anchos, unida por una pasarela firme y protegida con redes laterales.
En la entrada, un cartel de madera decía “La Rama Dorada”.
~ Background("Tabern_Background")
V empujó la puerta con suavidad y entró.
A esa hora, solo unos pocos clientes madrugadores bebían o leían. 
Tras la barra, un camarero de piel azulada, sin alas pero con unos cuernos finos que apuntaban hacia atrás, limpiaba un vaso.
Al ver a V, sonrió ampliamente.
~ Name("???")
—¡V, por todos los cielos! Pensé que ya te habrías muerto de hambre en ese bosque.
~ Name("V")
—Casi, Rekk 
~ Name("___")
La falta de energía en V era obvia.
~ Name("V")
Necesito información.
~ Name("___")
Rekk alzó una ceja, y al notar al niño que se escondía detrás V, su sonrisa se desvaneció un poco.
~ Name("Rekk")
—¿Y el crío?
~ Name("V")
—Complicado. ¿Sabes si alguien ha dejado alguna recompensa por un niño perdido?
~ Name("___")
El camarero dejó el vaso y asintió lentamente.
~ Name("Rekk")
—Justo esta mañana. Un tipo extraño dejó un cartel.
—No parecía del pueblo… Tenía una presencia... incómoda.
—No paraba de decir que había perdido algo <i>preciado</i>
—Si lo buscas, lo encontrarás en uno de los callejones bajos. Te puedo dar las indicaciones.
~ Name("___")
V asintió con seriedad.
Rekk dibujó en un trozo de papel un pequeño croquis de la zona baja del pueblo, una zona menos transitada que colgaba cerca de las raíces de los árboles, donde se ubicaban los talleres de curtidores y los almacenes.
~ Name("V")
—Gracias, Rekk. Si no vuelvo… ya sabes.
~ Name("Rekk")
—¿Cuándo has hecho algo fácil, V?
~ Name("___")
~ Background("Forest_Background") // bg: town
Las indicaciones de Rekk guiaron a V hacia los niveles más bajos de Frisbar, donde la vida del pueblo se volvía más sombría.
A medida que descendían por escaleras de cuerda y plataformas tambaleantes, el bullicio de la zona comercial quedaba atrás, 
ahogado por el crujido de la madera envejecida y el sonido lejano de herramientas golpeando cuero y metal.
El aire era más denso allí abajo, cargado de humedad y el penetrante olor a savia fermentada.
Musgo y líquenes crecían entre las grietas de los tablones, y los faroles de fuego verde apenas lograban disipar las sombras.
Somi se aferraba a la capa de V con fuerza, sus pasos eran suaves, pero sus dedos temblaban ligeramente.
La zona baja era conocida como “las raíces”, no sólo por su proximidad con la base de los árboles, sino porque allí se asentaban los aspectos más sombríos del pueblo: contrabandistas, tramperos, comerciantes de bestias raras y cazadores de recompensas sin escrúpulos.
// bg: callejones
Un callejón sin nombre, estrecho y mal iluminado, aguardaba al final del recorrido.
V se detuvo en la entrada.
Instintivamente, colocó su brazo frente a Somi para protegerlo. 
Allí, junto a unas cajas de madera y toneles mal apilados, un personaje rechoncho y grotesco destacaba en medio de la penumbra.
El individuo estaba iluminado solo por la luz mortecina de un farol.
Su silueta parecía sacada de una pesadilla cómica: un cuerpo obeso cubierto con ropas elegantes aunque mal ajustadas, un chaleco de terciopelo púrpura y una camisa blanca manchada de grasa.
Su piel era rosada, brillante, y su rostro, redondo como una manzana pasada, terminaba en un hocico por el que resoplaba aire de forma pesada.
Un monóculo plateado descansaba sobre su ojo derecho, y cada vez que hablaba, su diente de oro destellaba con malicia.
~ Name("???")
—Ah… tú debes ser el buen cazador del que me hablaron en la taberna.
~ Name("Pigstep")
—Soy Pigstep.
~ Name("___")
Pigstep ronroneó, arrastrando las palabras con una voz chillona y lenta, como si disfrutara cada sílaba.
V no respondió de inmediato.
Miró a los dos guardaespaldas que flanqueaban a Pigstep: eran Hek de aspecto rudo, armados con cuchillos de hueso y látigos enrollados en sus cinturones.
Sus ojos estaban clavados en Somi con una mezcla de interés profesional y desdén.
~ Expression("scared")
~ Name("V")
—Recibí el mensaje. Dijiste que buscabas a alguien.
~ Name("Pigstep")
—Y lo hiciste rápido, eso te honra. Vaya, vaya… qué criatura más encantadora traes contigo.
—Aunque... no diría que es “alguien”. Es más bien… un tesoro. Una anomalía. Algo <i>irrepetible.</i>
~ Name("___")
Somi se pegó a la pierna de V, su mano temblaba, pero su rostro seguía inexpresivo. V sintió cómo un escalofrío le recorría la espalda. Se obligó a mantener la calma.
~ Name("V")
—¿Qué sabes de él?
~ Name("Pigstep")
—Lo suficiente
—Lo encontré hace unos días, fuera de donde debería estar. Escapó.
—No es muy listo, pero tiene algo… magnético. Su especie está prácticamente extinta, ¿sabes? 
—Y aún así, aquí lo tienes, vivo, respirando. Todo un enigma. Un ejemplar único. Me pertenece.
~ Name("V")
—No es un objeto.
~ Name("___")
Espetó V, su voz tan fría como firme.
Pigstep abrió sus brazos como si fuera a dar un discurso.
~ Name("Pigstep")
—Todo en este mundo <i>es</i> un objeto, cazador. Todo tiene un precio. Lo que tú llamas vida, yo lo llamo inversión. 
—Lo que tú ves como un niño perdido, es el sueño de cualquier coleccionista de rarezas. Tú no lo entiendes. Pero yo sí.
~ Name("___")
 El aire en las “raíces” del pueblo era denso. V sentía los dedos de Somi aferrados a su capa mientras el rechoncho coleccionista hablaba con una sonrisa torcida.
~ Name("Pigstep")
—Ese niño no es tuyo, cazador. Me pertenece. Dámelo y quizás te ofrezca una vida cómoda. 
—Ropa, comida, una casa con chimenea... hasta podrías dejar de cazar Dant’ir por unas monedas.
~ Name("___")
V dudaba. Pigstep chasqueó los dedos y sus matones se acercaron.
-> choice_proteger

=== choice_proteger ===
#timed
*  Negarse y proteger a Somi. -> historia_continua4
* Aceptar la oferta y entregar al niño. -> Bad_End_4

=== Bad_End_4 ===
~ Name("___")
~ HideCharacter("v")
~ HideCharacter("kid")
~ CharacterIcon("v")
~ CharacterIcon("kid")
~ Expression("scared")
~ Background("Forest_Background")
V miró a Pigstep, luego al niño. Sintió el temblor en sus manos, la presión del momento, y el miedo…
El miedo a lo que podría venir si se equivocaba.
Soltó la mano de Somi.
~ Name("V")
—Haz lo que quieras. Yo solo soy un cazador. No me pagan por hacer preguntas.
~ Name("___")
~ HideCharacter("kid")
~ CharacterIcon("kid")
Somi no dijo nada. Ni gritó. Ni lloró. Solo bajó la cabeza mientras los matones lo sujetaban de los brazos.
Pigstep rió satisfecho.
~ Name("Pigstep")
—Sabia decisión, cazador. Has evitado problemas innecesarios. Te enviaré tu pago… si sobrevives el tiempo suficiente para gastarlo.
~ Name("___")
~ HideCharacter("kid")
V se marchó sin mirar atrás.
<b>[Días después…]</b>
Los rumores en Frisbar se descontrolaron.
Una criatura extraña fue vista encerrada en una jaula, exhibida en un mercado de rarezas.
Un niño, decían algunos.
Una maldición viva, decían otros.
Una semana más tarde, una extraña energía empezó a extenderse desde las zonas oscuras del bosque. 
Los Dant’ir se volvieron más feroces. Algunos incluso empezaron a “organizarse”, atacando pueblos en grupo, destruyendo granjas y devorando sin control.
V volvió a su cabaña. Se sentó frente a la chimenea.
La bolsa de monedas brillaba junto a sus botas.
~ Name("V")
—No era solo un niño, ¿verdad…?
~ Name("___")
La guerra había comenzado.
Y el cazador… se convirtió en testigo de su propio error.
<b>Final alternativo desbloqueado: “El precio del silencio”</b>
#change_scene: Game Over
-> END

=== historia_continua4 ===
~ HideCharacter("v")
~ HideCharacter("kid")
~ CharacterIcon("v")
~ Expression("angry")
~ CharacterIcon("kid")
~ Expression("scared")
El silencio que siguió fue espeso. El crujido de la madera bajo los pies de Pigstep pareció resonar como un trueno. V dio un paso atrás, y en ese instante, Pigstep sonrió.
~ Name("Pigstep")
—Creo que ya he tenido suficiente charla.
~ Name("___")
Pigstep chasqueo los dedos.
~ Name("Pigstep")
—Atrapad al mocoso.
~ Name("___")
Los guardias se lanzaron sin dudar. 
El primero avanzó con una velocidad sorprendente, desenfundando su cuchillo.
V reaccionó por puro instinto: se agachó, desenvainó una flecha de su carcaja y disparó.
La flecha se clavó en el hombro del atacante, haciéndolo gritar y trastabillar hacia un costado.
El segundo fue más precavido.
Blandió su látigo y lo lanzó hacia Somi. 
V lo interceptó con el antebrazo, sintiendo el dolor ardiente del impacto, pero no se detuvo.
Con la mano libre, desenvainó su cuchillo de caza y cargó contra él.
El segundo guardia intentó esquivarlo, pero V ya estaba encima, le dio un codazo en el rostro y lo lanzó contra un barril que se hizo añicos.
~ Name("Pigstep")
—<b>¡BASTA!</b>
~ Name("___")
Pigstep chilló, retrocediendo unos pasos, sus patas tambaleándose bajo el peso.
~ Name("Pigstep")
—¡No sabes lo que haces! ¡No puedes escapar! ¡Tarde o temprano, me lo llevaré! ¡Ese niño no tiene cabida en este mundo!
~ Name("___")
V levantó el arco de nuevo y apuntó directo al centro del monóculo. Pigstep alzó ambas manos, temblando.
~ Name("Pigstep")
—¡Lo juro! ¡Te arrepentirás! ¡¡No sabes con quién te estás metiendo!!
~ Name("___")
Pero ya era tarde. V se giró, alzó a Somi y echó a correr, perdiéndose entre las sombras del callejón.
~ HideCharacter("v")
~ CharacterIcon("v")
Dejaron atrás el corazón de Frisbar, descendiendo hasta las raíces más profundas, corriendo por caminos ocultos que V conocía de su niñez. 
Nadie los persiguió. Al menos por ahora. La espesura del bosque los acogió con su silencio húmedo y susurros verdes.
Somi, aunque temblaba, no lloraba.
V lo apretó con más fuerza contra su pecho. Algo en su interior había cambiado. Ya no era solo un acto de compasión. 
Era una decisión.
~ Name("V")
—Estás conmigo ahora. Y nadie volverá a poner un dedo sobre ti.
~ Name("___")
~ Expression("happy")
Ambos desaparecieron entre los árboles. Sin rumbo, sin mapa, pero juntos.
#change_scene: Final
-> END
