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
    - [3.1 Vorbereitung der Kodierung](#3.1)
    - [3.1 SKOS-Kodierung des Vokabulars](#3.2)
    - [3.2 Veröffentlichung mit SKOHub Pages](#3.3)
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
### 3.1 Vorbereitung der Kodierung
Als Grundlage für die Bearbeitung der Aufgabe und um ein Verständnis für SKOS zu gewinnen wurde von den Gruppenmitgliedern die in der Aufgabenstellung verlinkte _Einführung in SKOS_ von Felix Lohmeier, Adrian Pohl und Jakob Voß gelesen und das dort bereitgestellte Tutorial durchgearbeitet.[^1] Viele der dort beschriebenen Schritte und Vorgehensweisen konnten für die Bearbeitung der Aufgabe direkt übernommen werden. 

Vor der eigentlichen Kodierung wurde eine finale Liste der zu überführenden Begriffe erstellt. Da ein zweisprachiges Vokabular erstellt werden sollte, waren mindestens 20 Begriffe zu wählen. Wie bereits beschrieben wurde hier Wert darauf gelegt, auch Begriffe mit Synonymen oder weiteren Unterelementen auszuwählen. Anschließend wurden die relevanten NDB-Felder identifiziert und wie in der folgenden Tabelle dargestellt den jeweiligen SKOS-Elementen zugewiesen:

| NDB-Feld      | SKOS          |
| ------------- | ------------- |
| Deskriptor    | prefLabel     |
| Synonym       | altLabel      |
| Erläuterung   | description   |
| Vokabel-ID    | notation      |
| Untergeordnete Elemente | narrower |

_skos:narrower_ konnte in den meisten Fällen mit der Bezeichnung des _concepts_ "Berufe" ausgefüllt werden. Lediglich in Fällen, in denen ein Begriff in einer tieferen Hierarchieebene eingeordnet war, musste dieser geändert werden.

<a name="3.2"></a>
### 3.2 SKOS-Kodierung des Vokabulars

Der Code wurde zunächst im Turtle Web Editor[^2] geschrieben, der auch für die Bearbeitung des Tutorials empfohlen wird. 

Die ersten vier Codezeilen wurden aus dem Tutorial übernommen, lediglich die base-URL wurde geändert:

```
@base <https://normdb.ivz.cn.ard.de/> .  # die URL musste zu einem späteren Zeitpunkt fehlerbedingt erneut geändert werden. Siehe dazu Kapitel 3.3 des Projektberichtes
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefix dct: <http://purl.org/dc/terms/> .
```

Anschließend wurde das Vokabular definiert. Entsprechend der Quelle wurde das Vokabular _NDB_ genannt, da die vorliegende Auswahl lediglich aus Begriffen des Vokabulars _Berufe und Funktionen_ besteht, wurde diese Bezeichnung als dct:prefLabel und dct:title angegeben. Bei einer umfangreicheren SKOS-Kodierung der Normdatenbank müssten diese Begriffe gegebenenfalls abgeändert und _Berufe und Funktionen_ als TopConcept verwendet werden. In dct:discription befindet sich eine Kurzbeschreibung des erstellten Vokabulars. Da es sich beim Quellvokabular um das der ARD handelt und in der Normdatenbank keine sonstigen Urheber angegeben sind, wurde für das Feld dct:creator die ARD als Urheber angegeben. Das Feld dct:issued entspricht dem Datum der Projektabgabe, in dct:licence ist die CC-by Lizenz angegeben. Als Bezeichnung des TopConcepts wurde in skos:hasTopConcept _Berufe_ gewählt.

```
<NDB> a skos:ConceptScheme ;
  skos:prefLabel "Berufe und Funktionen"@de, "Professions and functions"@en ; # die NDB der ARD wird nur in deutscher Sprache gepflegt. Alle englischen Übersetzungen wurden für die Aufgabenlösung selbst erstellt.
  dct:title "Berufe und Funktionen"@de, "Professions and functions"@en ;
  dct:description "SKOS-kodierter Ausschnitt aus der Normdatenbank, die in der ARD zur Inhaltserschließung genutzt wird."@de, "SKOS-coded excerpt from the standard database which is used for context indexing in the ARD."@en ;
  dct:creator "Arbeitsgemeinschaft der öffentlich-rechtlichen Rundfunkanstalten der Bundesrepublik Deutschland"@de, "Association of Public Broadcasting Corporations of the Federal Republic of Germany"@en ;
  dct:issued "2025-30-01" ;
  dct:license "https://creativecommons.org/licenses/by-nc-sa/4.0/" ;
  skos:hasTopConcept <Berufe> .
```

Im nächsten Abschnitt ist das TopConcept definiert. Dieses wurde im Feld skos:definition mit einer Beschreibung versehen, alle ausgewählten Berufe der Normdatenbank wurden in skos:narrower als Unterelemente definiert.

```
<Berufe> a skos:Concept ;
  skos:prefLabel "Berufe"@de, "Professions"@en ;
  skos:definition "Arbeit oder Tätigkeit, mit der jemand sein Geld verdient."@de, "work or activity with which someone earns money."@en ;
  skos:narrower <Altphilologe>, <Anatom>, <Arbeiter>, <Architekt>, <Archivar>, <Astrologe>, <Astronom>, <Autor>, <Außenminister>, <Bakteriologe>, <Bergarbeiter>, <Bibliothekar>, <Botschafter>, <Cellist>, <Clown>, <Dokumentar>, <Ethnologe>, <Fotograf>, <Geiger>, <Historiker>, <Instrumentenbauer>, <Juwelier> ; # die gewählten Berufe stellen lediglich eine willkürliche Auswahl des vollständigen Vokabulars dar.
  skos:topConceptOf <NDB> .
```

Für die nun in die SKOS-Kodierung zu überführenden Vokabeln konnte ausgehend von den im Tutorial gelernten Basiskenntnissen und den zuvor identifizierten NDB-Feldern eine Vorlage erarbeitet werden, in der lediglich die entsprechenden Eintragungen manuell zu ergänzen waren.

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

Mit einer kleinen Auswahl an SKOS-Kodierten Vokabeln wurde anschließend ein erster Test im SKOS testing tool durchgeführt.[^4] Dieser sollte zeigen, ob die bis hierhin getätigten Eintragungen in base, ConceptScheme, TopConcept und den ersten Vokabeln korrekt sind. Erwartungsgemäß zeigte das Testing Tool im unvollständigen Code mehrere Fehlermeldungen an: _Missing Labels_, _Undocumented Concepts_ und _Unidirectionally Related Concepts_. Da diese alle auf das Fehlen von im TopConcept definierten Unterlementen zurückzuführen waren, konnte der Code bis hierhin als in Ordnung angesehen werden. Konkrete Änderungen waren keine Vorzunehmen, lediglich die fehlenden Elemente waren zu ergänzen.

Nach erfolgter Ergänzung der weiteren Vokabeln wurde ein erneuter Test durchgeführt, der nun zusätzliche Fehlermeldungen lieferte. Nach Vergleich der Meldungen mit dem Code waren diese auf zwei Flüchtigkeitsfehler zurückzuführen: ein _Concept_ wurde versehentlich mit der identischen Bezeichnung versehen wie das vorherige, wodurch der Fehler _Ambiguous Notation References_ aufgrund zweier Notationen für denselben Begriff erzeugt wurde. Zudem war der Fehler _Missing Labels_ weiterhin existent, da ein im TopConcept definierter Begriff weiterhin fehlte. Desweiteren wurde das Concept <Gastarbeiter>, bei dem es sich um ein Unterelement von <Arbeiter> handelt, direkt dem TopConcept <Berufe> zugeordnet. Dadurch wurde die hierarchische Ordnung gestört.

Die nun noch existierenden Fehler konnten durch kleinere Anpassungen im Code ausgebessert werden: Die doppelt vergebene Concept-Bezeichnung wurde korrigiert, im Concept <Gastarbeiter> wurde das Feld skos:narrower angepasst. Ein erneuter Test verlief fehlerfrei.



<a name="3.3"></a>
### 3.3 Veröffentlichung mit SKOHub Pages

Für die Veröffentlichung mit SKOHub Pages wurde zunächst von einem Gruppenmitlied das skohub-pages-Repositorium geforked und entsprechend der dort hinterlegten Beschreibung vorbereitet.[^3] Zugunsten der Übersichtlichkeit wurden die Dateien _colors.ttl_ und _colors_with_hierarchy.ttl_ entfernt. Nun wurde die zuvor erfolgreich mit dem SKOS testing tool auf korrekte Syntax überprüfte Datei _NDB_Berufe_SKOS.ttl_ ins Repositorium hochgeladen.

Beim Öffnen des entstandenen SkoHub Vocabs zeigte sich ein weiterer Fehler. Der in @base verwendete Link zur Normdatenbank konnte nicht verarbeitet werden, da dieser nicht über das öffentliche Internet, sondern nur über das ARD-Netz zugänglich ist. Der Link wurde stattdessen durch den Link zu SkoHub Vocabs ersetzt, wonach das Vokabular erfolgreich veröffentlicht wurde und geöffnet werden konnte. Abschließend mussten am Vokabular lediglich Rechtschreibung und Orthographie korrigiert und vereinheitlicht werden.

<a name="4"></a>
## **4. Kapitelname**


<a name="5"></a>
## **5. Kapitelname**





[^1]: Felix Lohmeier, Adrian Pohl und Jakob Voß: Einführung in SKOS, o. D., [online] https://dini-ag-kim.github.io/skos-einfuehrung/#/.
[^2]: https://felixlohmeier.github.io/turtle-web-editor/. 
[^3]: https://github.com/skohub-io/skohub-pages.
[^4]: https://skos-play.sparna.fr/skos-testing-tool/.
