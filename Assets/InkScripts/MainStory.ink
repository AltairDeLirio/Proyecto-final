EXTERNAL Name(charName)
EXTERNAL CharacterIcon(charName)
EXTERNAL Expression(expressionName)
EXTERNAL HideCharacter(charName)

~ Name("___")
Nuestro mundo. El mundo original. El primero de todos. Justo antes de que llegaran ellos… Al fin ha resurgido de sus cenizas. Después de casi 50 mil años, por fin podemos regresar a nuestro hogar.
~ CharacterIcon("v")
V se encontraba cazando en el bosque como de costumbre, pues ese día no tenía nada para comer, cosa que también era habitual en su vida.
Era increíblemente hábil haciendo uso del arco, casi nunca fallaba una flecha. Ese día, atrapó muchas aves, lo que le permitiría comer durante unos días sin tener que preocuparse.
Terminando su jornada, V se dispusó a ir a lo que llamaba su hogar.
Una simple cabaña en un lado del bosque.
Sin embargo, justo cuando empezaba su camino a casa, escuchó unos fuertes aullidos al oeste. /* meter sonido aqui */
Puso rumbo al origen de aquellos sonidos, puesto que ya conocía de sobra de qué se trataba.
En cuanto llegó a la zona, lo confirmó.
Se trataba de una pequeña manada de Dant’irs, unas criaturas muy temidas en su mundo, los depredadores naturales de los Hek.
V era un cazador experimentado. Evitaba meterse en problemas siempre que podía, pero había algo raro en esos Dant’ir.
Normalmente nunca iban en manada, solamente cuando se disponían a cazar a algún Hek, pero V sabía que el único Hek de la zona era él mismo, por lo que inmediatamente pensó que alguien más había entrado al bosque y se había perdido.

#change_scene: Minigame_shoot

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
En ese momento, el niño abrió los ojos. Unos ojos marrones que miraban fijamente a los de V.
Sin dudarlo, el Hek sacó su arco y apuntó a la frente del niño. V estaba aterrado, no sabía lo que tenía delante. O al menos, no quería reconocerlo. 
~ HideCharacter("v")
-> choice_disparar

=== choice_disparar ===
#timed
* [Dispara al niño.] -> Bad_End_1
-> no_dispara

=== Bad_End_1 ===
texto //falta añadir el final
-> END

=== no_dispara ===
El niño se puso de pie.
-> historia_continua

=== historia_continua ===
~ CharacterIcon("kid")
~ CharacterIcon("v")
No podía medir más de 110 cm de altura, casi ni le llegaba a la altura de las rodillas a V.
-> END
