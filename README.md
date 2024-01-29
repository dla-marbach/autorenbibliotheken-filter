# autorenbibliotheken-filter

Prozess zum Filtern der Exemplare in Autorenbibliotheken, entwickelt im Rahmen des Text+-Kooperationsprojekts DLA Data+

Der Datendienst ermöglicht den gezielten Abruf der Autorenbibliotheken, beispielsweise von Döblin und Kracauer:
* [Autorenbibliothek Alfred Döblin](https://www.dla-marbach.de/bibliothek/spezialsammlungen/bestandsliste/bibliothek-alfred-doeblin)
  * Bestand im Katalog: https://www.dla-marbach.de/find/opac/id/BF00019097/
  * Titeldaten: https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019097
  * Exemplare und Provenienzmerkmale: https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019097
* [Autorenbibliothek Siegfried Kracauer](https://www.dla-marbach.de/bibliothek/spezialsammlungen/bestandsliste/bibliothek-siegfried-kracauer)
  * Bestand im Katalog: https://www.dla-marbach.de/find/opac/id/BF00019677/
  * Titeldaten: https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019677
  * Exemplare und Provenienzmerkmale: https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019677

Allerdings enthalten diese Daten neben Provenienzexemplaren der Autorenbibliothek auch Exemplare anderer Bestände im DLA. Die Ausgabe der Galgenlieder von Christian Morgenstern im Verlag Bruno Cassirer von 1932 (vgl. [Exemplare im Katalog](https://www.dla-marbach.de/find/opac/id/AK00416805/?tx_find_find%5bau%5d=00605895%23tabaccess)) ist z.B. in fünf Autorenbibliotheken vorhanden. Was im Katalog spannende Schnittmengen sein können, ist bei einer gezielten (statistischen) Auswertung und Visualisierung von Provenienzspuren einer bestimmten Autorenbibliothek unerwünschter Beifang, der verfälscht.

Dieses Repository beinhaltet einen Prozess am Beispiel der Autorenbibliothek von Alfred Döblin, um die Daten nachträglich zu "putzen". Um den Prozess auf andere Autorenbibliotheken anzuwenden, muss nur der Identifier des gewünschten Teilbestands (z.B. `BF00019097`) im Script ausgetauscht werden.

Fragen beantwortet gerne [Felix Lohmeier](https://github.com/felixlohmeier).

## Daten

* [input](input) beinhaltet einen Download der Autorenbibliothek von Alfred Döblin vom DLA Datendienst im Format CSV
* [output](output) beinhaltet die gefilterten Daten im Format JSON-Lines

Stand des Datenabzugs: 29.01.2024

Es ist geplant, den Prozess in Kürze zu automatisieren und in diesem Repository regelmäßig aktualisierte Beispieldaten bereitzustellen.

## Anpassung für andere Autorenbibliotheken

1. Repository klonen
2. In [main.sh](main.sh) den Identifier in Download-Links anpasssen (z.B. `BF00019097`)
3. Prozess mit GitHub Codespaces, GitHub Actions oder lokal ausführen (siehe unten)

Hinweis: Bei sehr großen Autorenbibliotheken benötigt OpenRefine ggf. mehr Arbeitsspeicher als in der Standardkonfiguration. Das kann beim Aufruf von orcli mit dem Parameter `--memory` eingestellt werden.

### A) GitHub Codespaces

1. Persönlichen Codespace starten (benötigte Software wird automatisch installiert)
2. Prozess im Terminal starten

    ```
    orcli run main.sh
    ```

### B) GitHub Actions

1. Repository klonen
2. Im Tab "Actions" den vorkonfigurierten Workflow `example` starten

### C) Lokal

1. OpenRefine und [orcli](https://github.com/opencultureconsulting/orcli) installieren
2. Prozess starten

    ```
    orcli run main.sh
    ```
