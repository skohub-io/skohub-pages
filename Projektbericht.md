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
    - [3.2 Veröffentlichung mit SKOHub Pages](#3.2)
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

Die Normdatenbank wird lediglich in deutscher Sprache geführt. Die Gruppe hat sich dennoch für die Erstellung eines zweisprachigen SKOS-Vokabulars entschieden, für das die entsprechenden Felder eigenständig übersetzt wurden. In einigen Fällen fehlte eine Definition der Vokabel in der NDB. Statt auf eine Begriffserklärung zu verzichten wurde für entsprechende Begfiffe auf die jeweilige Definitionen des Dudens zurückgegriffen.

Im weiteren Verlauf des Projektberichtes wird darauf eingegangen, welche Felder der NDB für relevant erachtet und wie diese in der SKOS-Kodierung implementiert wurden.

<a name="2"></a>
## **2. Kapitelname**


<a name="3"></a>
## **3. Umsetzungsphase**
Im Folgenden wird die Umsetzung genauer Beschrieben. Dabei soll zunächst detailliert darauf eingegangen werden, welche Felder der NDB genutzt und wie diese in die SKOS-Kodierung eingearbeitet wurden. Im zweiten Schritt wird auf den Veröffentlichungsvorgang des Vokabulars ober SKOHub Pages eingegangen. In der Beschreibung wird auch auf Probleme eingegangen, die bei der Umsetzung aufgetreten sind.


<a name="3.1"></a>
### 3.1 SKOS-Kodierung des Vokabulars
Als Grundlage für die Bearbeitung der Aufgabe und um ein Verständnis für SKOS zu gewinnen wurde von den Gruppenmitgliedern die in der Aufgabenstellung verlinkte _Einführung in SKOS_ von Felix Lohmeier, Adrian Pohl und Jakob Voß gelesen und das dort bereitgestellte Tutorial durchgearbeitet.[^1] Viele der dort beschriebenen Schritte und Vorgehensweisen konnten für die Bearbeitung der Aufgabe direkt übernommen werden. 

Der Großteil des Codes wurde zunächst im Turtle Web Editor[^2] geschrieben, der auch für die Bearbeitung des Tutorials empfohlen wird. Eben

_Erstellung der Base, des ConceptSchemes und des Concepts ergänzen_

Für die nun in die SKOS-Kodierung zu überführenden Vokabeln konnte ausgehend von den im Tutorial gelernten Basiskenntnissen eine Vorlage erarbeitet werden, in der lediglich die entsprechenden Eintragungen manuell zu ergänzen waren.

```
<x> a skos:Concept ;                # Berufsbezeichnung
  skos:prefLabel "x"@de, "x"@en ;   # Berufsbezeichnung in deutscher und englischer Sprache
  skos:definition "x"@de, "x"@en ;  # Definition des Berufs in deutscher und englischer Sprache
  skos:broader <Berufe> ;           # zu ersetzen, sollte die Vokabel hierarchisch nicht direkt _Berufe_ untergeordnet sein
  skos:notation "x" ;               # Vokabel-ID der NDB
  skos:inScheme <NDB> .
```

Einige Vokabeln enthielten weitere Unterelemente. Für diese musste das Feld _skos:narrower <x>_ mit der entsprechenden Bezeichnung der untergeordneten Vokabel ergänzt werden. Zusätzlich war in der untergeordneten Vokabel _skos:broader <x>_ entsprechend zu ändern.

Desweiteren waren einige Vokabeln in der NDB mit Synonymen versehen. Für diese war das Feld _skos:altLabel "x"@de, "x"@en_ mit entsprechendem Synonym in deutscher und englischer Sprache zu ergänzen.


<a name="3.2"></a>
### 3.2 Veröffentlichung mit SKOHub Pages

Für die Veröffentlichung mit SKOHub Pages wurde zunächst von einem Gruppenmitlied das skohub-pages-Repositorium geforked und entsprechend der dort hinterlegten Beschreibung vorbereitet.[^3] Zugunsten der Übersichtlichkeit wurden die Dateien _colors.ttl_ und _colors_with_hierarchy.ttl_ entfernt. Nun wurde die zuvor erfolgreich mit dem SKOS testing tool auf korrekte Syntax überprüfte Datei _NDB_Berufe_SKOS.ttl_ ins Repositorium hochgeladen.

Beim Öffnen des entstandenen SkoHub Vocabs zeigte sich ein weiterer Fehler. Der in @base verwendete Link zur Normdatenbank konnte nicht verarbeitet werden, da dieser nicht über das öffentliche Internet, sondern nur über das ARD-Netz zugänglich ist. Der Link wurde stattdessen durch den Link zu SkoHub Vocabs ersetzt, wonach das Vokabular erfolgreich veröffentlicht wurde und geöffnet werden konnte. Im Folgenden mussten am Vokabular lediglich Rechtschreibung und Orthographie korrigiert und vereinheitlicht werden.

<a name="4"></a>
## **4. Kapitelname**


<a name="5"></a>
## **5. Kapitelname**





[^1]: Felix Lohmeier, Adrian Pohl und Jakob Voß: Einführung in SKOS, o. D., [online] https://dini-ag-kim.github.io/skos-einfuehrung/#/.
[^2]: https://felixlohmeier.github.io/turtle-web-editor/. 
[^3]: https://github.com/skohub-io/skohub-pages.
