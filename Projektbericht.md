# Publikation eines kontrollierten Vokabulars mit SkoHub Vocabs

Projektbericht MALIS 24.2 IT 2 - Dozent: Adrian Pohl

**Arbeitsgruppe:**

Jil Marie Blum (Matrikelnummer: xxxxxxxx )

Stephan Höing (Matrikelnummer: 11333362 )

Rieke Paetsch-Saleh (Matrikelnummer: xxxxxxxx )

## Inhalt
- [1. Auswahl und Beschreibung des Vokabulars](#1)
    - [1.1 Aufbau der Normdatenbank](#1.1)
- [2. Organisation der Zusammenarbeit ???](#2)
- [3. Umsetzungsphase](#3)
    - [3.1 SKOS-Kodierung des Vokabulars](#3.1)
    - [3.2 Veröffentlichung über SKOHub Pages](#3.2)
- [4. Kapitelname](#4)
- [5. Kapitelname](#5)
  
<a name="1"></a>
## **1. Auswahl und Beschreibung des Vokabulars**
In der Normdatenbank (kurz NDB) der ARD wird das standartisierte, für die inhaltliche Erschließung von gesendetem Material genutzte Vokabular gesammelt. Zur Vereinheitlichung der Erschließung und der vereinfachten Recherche über Anstaltsgrenzen hinaus wird dieses Vokabular in der gesamten ARD verwendet. Da zwei Mitglieder dieser Projektgruppe durch vergangene oder derzeitige Anstellung im WDR mit der Normdatenbank vertraut sind und diese noch nicht SKOS-kodiert vorliegt, wurde die NDB als Grundlage für die Lösung der Aufgabe genutzt. Da die Normdatenbank Eintragungen im siebenstelligen Bereich enthält wurde für das Projekt lediglich ein kleiner Teil des Gesamtvokabulars genutzt. Dabei wurde besonderer Wert auf die Auswahl einzelner Vokabeln gelegt, die sich durch zusätzliche Felder von anderen unterscheiden. So wurden gezielt einige Begriffe ausgewählt, die beispielsweise alternative Bezeichnungen oder weitere Unterelemente enthalten.
 
<a name="1.1"></a>
### 1.1 Aufbau der Normdatenbank
Die Normdatenbank ist in mehrere Teilbereiche untergliedert, in denen neben Vokabeln unter anderem auch Personen, Institutionen und für das ARD-Programm relevante Sendereihen vereinheitlicht sind. In der inhaltlichen Erschließung von Archivmaterial kann eine Eintragung mit der NDB synchonisiert werden, wodurch beispielsweise Personen oder Homonyme eindeutig identifizierbar werden.

Der für das Projekt relevante Teil _Vokabulare_ ist in 17 Teile unterteilt. Die vorliegende Arbeit basiert auf einer Auswahl von Begriffen aus dem Vokabular _Berufe und Funktionen_. Die Berufsbezeichnungen sind alphabetisch geordnet und liegen in den meisten Fällen sowohl in männlicher als auch in weiblicher Form vor. Um eine größere Anzahl unterschiedlicher Berufe in der SKOS-Kodierung abzubilden, wurde entschieden, für das Projekt lediglich die männliche Ansetzungsform zu verwenden.

Jeder Eintrag der NDB erhält eine Vokabel-ID, über die dieser eindeutig identifizierbar gemacht wird. Im Eintrag einer Vokabel befinden sich zudem Verweise auf alternative Bezeichnungen, ggf. tiefere Hierarchieebenen und in vielen Fällen eine Erläuterung des Begriffs.

![](https://github.com/shoeing1/MALIS24_NDB/blob/main/NDB%20Screenshot.png)
Abb. 1: Screenshot des NDB-Eintrags _Arbeiter_

Im weiteren Verlauf des Projektberichtes wird darauf eingegangen, welche Felder der NDB für relevant erachtet und wie diese in der SKOS-Kodierung implementiert wurden.

<a name="2"></a>
## **2. Kapitelname**


<a name="3"></a>
## **3. Umsetzungsphase**
Im Folgenden wird die Umsetzung genauer Beschrieben. Dabei soll zunächst detailliert darauf eingegangen werden, welche Felder der NDB genutzt und wie diese in die SKOS-Kodierung eingearbeitet wurden. Im zweiten Schritt wird auf den Veröffentlichungsvorgang des Vokabulars ober SKOHub Pages eingegangen. In der Beschreibung wird auch auf Probleme eingegangen, die bei der Umsetzung aufgetreten sind.

<a name="3.1"></a>
### 3.1 SKOS-Kodierung des Vokabulars


```
<Anatom> a skos:Concept ;
  skos:prefLabel "Anatom"@de, "Anatomist"@en ;
  skos:definition "Wissenschaftler, der den Aufbau des Körpers von Lebewesen untersucht."@de, "scientist who studies the structure of the body of living beings."@en ;
  skos:broader <Berufe> ;
  skos:notation "135494" ;
  skos:inScheme <NDB> .
```

<a name="3.2"></a>
### 3.2 Veröffentlichung über SKOHub Pages


<a name="4"></a>
## **4. Kapitelname**


<a name="5"></a>
## **5. Kapitelname**
