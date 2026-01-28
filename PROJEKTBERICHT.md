# „Publikation eines kontrollierten Vokabulars mit SkoHub Pages“
# MALIS: Kleines IT2-Praxisprojekt in einer Dreiergruppe (V.P., J.S., K.Z.)

# Ergebnisse: 
[git-Repositorium] (https://github.com/JudiSchumi/skohub-pages)  
[Mit SkoHub Pages publiziertes SKOS-Vokabular] (https://judischumi.github.io/skohub-pages/w3id.org/dsh/schulfaecher/index.html) 

# Projektbericht:

## Auswahl des Vokabulars
Wir haben uns für die Schulfächer der Deutschen Schule in Helsinki entschieden, weil wir gerne ein zweisprachiges Vokabular im internationalen Kontext erstellen wollten. Zudem haben wir einen persönlichen Bezug zum Vokabular, da eine der Gruppenteilnehmerinnen an dieser Schule tätig ist. Die Schulfächer sind sowohl auf Deutsch, als auch auf Finnisch verfügbar. Eine mögliche Weiterbearbeitung kann international erfolgen, durch andere deutsche Auslandsschulen beispielsweise.

Wir haben für die Beschreibung der 20 Schulfächer folgende Properties verwendet:  
**-	Inhaltliche Beschreibung (zweisprachig Deutsch/Finnisch):**  
    - prefLabel: Bevorzugte, offizielle Bezeichnung des Schulfaches,  
    - altLabel: Alternative, inoffizielle Bezeichnungen des Schulfaches und Slangnamen sowie Abkürzungen,  
    - definition/description: Inhaltliche Erläuterung des Schulfaches,  
    - scopeNote: Hinweise zur Unterrichtssprache.  
**- Hierarchische und strukturelle Verknüpfung:**  
    - broader: Einordnung in Wissenschaftsbereiche, z. B. Naturwissenschaften,  
    - inScheme, hasTopConcept, topConceptOf: Technische Einbindung in das Gesamtschema.  
**-	Metadaten:**  
    - publisher: Herausgeber (Deutsche Schule Helsinki),  
    - modified: Letztes Änderungsdatum.  

## Zusammenarbeit: 
Die Zusammenarbeit erfolgte neben dem GitHub-Repo auch auf Google Docs. Dort haben wir in mehreren Treffen unsere Arbeit vorab erstellt, besprochen und für den Bericht festgehalten. Danach haben wir es auf GitHub eingefügt, sodass nur eine von uns ein GitHub Konto erstellen musste und das Erstellen bzw. Ändern der besprochenen Aspekte übernommen hat. Die Zusammenarbeit hat so gut geklappt. Da dies erst unsere zweite Arbeit mit GitHub war und wir in vorherigen Projekten, auch in dieser Konstellation, schon mit GoogleDocs gearbeitet hatten, haben wir uns gegen ein Kanban in GitHub entschieden und für das schon bekannte Tool. Die Zusammenarbeit hat gut funktioniert, allerdings war das Thema für uns alle unbekannt. Keine von uns hat technische Vorkenntnisse, also nicht immer einfach. Die Commits im GitHub zeigen, dass wir viel ausprobiert haben, um zu sehen, ob es für unsere Zwecke passt oder um zu überprüfen, ob bestimmte Befehle richtig codiert wurden.

## Einrichten des Git-Repo: 
Da das Forken der Vorlage aus der Aufgabe IT2.1 bekannt war, dachten wir nicht, dass dies Probleme bereiten könnte. Allerdings wurde zunächst tatsächlich nur die main branch geforkt, da es beim Forken kein Auswahlkästchen gab, bei dem man dies hätte ändern können. Als Verbesserung für die Dokumentation wäre unser Vorschlag, bereits oben in der Usage-Section einen Hinweis auf das Troubleshooting weiter unten zu geben. Dies haben wir nämlich zunächst nicht gesehen, auch, weil wir der Anleitung Schritt-für-Schritt gefolgt sind und dann die folgenden Schritte nicht ausführbar waren. Wir sind der Lösung dann auch nur mittels der Hilfe von ChatGPT auf die Spur gekommen. Nachdem wir den Fehler behoben und den weiteren Schritten gefolgt sind, ist uns dann die Troubleshooting-Section aufgefallen, aber leider zu spät.

Folgende Bereiche haben Probleme bereitet bzw. Fragen aufgeworfen:  
**- Custom Domain:** hat sich uns leider nicht erschlossen, alle Versuche, dies einzurichten, sind fehlgeschlagen;  
**- Vorlage, die geforkt werden muss:**  wieso sind in der Vorlage genau diese Dateien enthalten und zu welchem Zweck?;  
**- config.yml:** alle Versuche, eine solche Datei aufzusetzen und zu ändern, führten zu Fehlermeldung auf der SkoHub-Page. Wir haben nun eine Kopie der Datei für unser Vokabular eingestellt, diese aber unverändert gelassen;  
**- die vorhandenen turtle-Dateien zu Colors:** sollten diese bleiben? Da wir nicht wollten, dass sie auf unserer SkoHub-Page angezeigt werden, haben wir sie sehr mühsam und mit viel Ausprobieren gelöscht;  
**- commits:** hätten diese Beschreibungen benötigt? Da wir sehr viel hin und her probieren mussten, und oft das Ergebnis nicht kannten, haben wir keine Beschreibungen der commits eingefügt.

## SKOS-Transformation: 
Die Stundentafel hatten wir als PDF vorliegen, aus diesem haben wir dann eine Excel-Tabelle mit allen Deskriptoren erstellt und diese beschrieben und übersetzt. Zunächst war geplant, mittels der Excel-Tabelle, OpenRefine und RDF-Export eine semi-automatisierte Transformation nach SKOS durchzuführen. Allerdings ist der RDF-Export nicht mehr standardmäßig in OpenRefine vorhanden, so dass wir eine spezielle Extension benötigt hätten. Das Installieren der RDF-Extension hat aber leider nicht funktioniert, so dass wir schlussendlich die Turtle-Datei, und somit auch die SKOS-Transformation, doch händisch erstellen mussten.

## Ausblick: 
Eltern, die sich mit SKOS-Repräsentationen beschäftigen, werden auf die Deutsche Schule und ihre Fächer aufmerksam gemacht. 

Zudem wird generell über das Vokabular an deutsche Auslandsschulen informiert. Ein internationaler Vergleich mit innerdeutschen Schulen zu schulischen oder informativen Zwecken ist ebenso möglich - für Lehrende und Schüler:innen - auch durch die nun erfolgte Interoperabilität. Ein SKOS-Vokabular kann auch mit Schulverwaltungssoftware, Lernmanagementsysteme und anderen (Bildungs-) Datenbanken genutzt werden.

Eventuell lassen sich sogar mit unserem SKOS-Vokabular Fächerbezeichnungen international abgleichen, Bildungsprojekte länderübergreifend koordinieren und Leistungen besser anerkennen. Hierzu könnte unser Vokabular mit weiteren Fächern deutscher Auslandsschulen erweitert werden.

## Verständnis von RDF und SKOS vor und nach Bearbeitung der Aufgabe:
Sowohl für das Einrichten des Repo als auch die Transformation gilt, dass wir dies mit unseren (nicht-vorhandenen) technischen Kenntnissen nicht alleine hätten bewältigen können. So haben wir, wie oben schon beschrieben, vieles ausprobiert, die Hintergründe haben sich uns aber nicht immer erschlossen, selbst wenn die Versuche von Erfolg gekrönt waren. Zudem mussten wir immer wieder ChatGPT als Hilfs-Tool zurate ziehen, um uns technische Besonderheiten und Vorgänge erklären zu lassen. Dies hat leider unsere Aufmerksamkeit bei der Bearbeitung der Aufgabe von SKOS und RDF stark abgelenkt und das Verständnis für SKOS in den Hintergrund verdrängt. Im Mittelpunkt der Arbeit stand leider GitHub und wie man damit arbeitet und nicht SKOS und RDF. 

Allerdings haben wir durch dieses Projekt grundsätzlich gelernt, dass die Auffindbarkeit (Discoverability) eines kontrollierten Vokabulars im Web nicht allein von der Qualität seines Inhalts abhängt. Entscheidend ist vielmehr die Einhaltung von Semantic-Web-Standards wie SKOS. Erst durch die maschinenlesbare Kodierung und die Bereitstellung als Linked Data wird das Vokabular interoperabel.
