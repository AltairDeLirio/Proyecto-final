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
* [Ir a investigar los aullidos] -> historia_continua
* [Ignorar los sonidos y regresar a casa] -> Bad_End_1

=== Bad_End_1 ===
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
* [Dispara al niño.] -> Bad_End_2
* [No dispara] -> no_dispara

=== Bad_End_2 ===
texto //falta añadir el final
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
// bg: cabin
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
// bg: forest
V se llevó a Somi fuera.
Comprobó que el agua de la bañera estuviera caliente y agarró a Somi de los hombros para meterlo dentro.
Cogió un trapo, algo sucio, y empezó a limpiar el cuerpo de Somi. Le lavó la sangre, la suciedad y el pelo.
Somi apenas puso resistencia, al contrario.
Parecía feliz y estaba relajado en esa situación.
V terminó de limpiarlo. Lo sacó del agua y lo dejó de pie en el suelo. 
Entró de nuevo a casa y volvió a salir con una tela grande, que utilizó a modo de toalla para secarlo.
// bg: cabin
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
-> END
