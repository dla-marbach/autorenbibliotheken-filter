# autorenbibliotheken-filter
Prozess zum Filtern der Exemplare in Autorenbibliotheken, entwickelt im Rahmen des Text+-Kooperationsprojekts DLA Data+

Der Datendienst ermöglicht den gezielten Abruf der Autorenbibliotheken, beispielsweise von Döblin und Kracauer:
* [Autorenbibliothek Siegfried Kracauer](https://www.dla-marbach.de/bibliothek/spezialsammlungen/bestandsliste/bibliothek-siegfried-kracauer)
  * Titeldaten: https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019097
  * Exemplare und Provenienzmerkmale: https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019097
* [Autorenbibliothek Alfred Döblin](https://www.dla-marbach.de/bibliothek/spezialsammlungen/bestandsliste/bibliothek-alfred-doeblin)
  * Titeldaten: https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019677
  * Exemplare und Provenienzmerkmale: https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019677

Allerdings enthalten diese Daten neben Provenienzexemplaren der Autorenbibliothek auch Exemplare anderer Bestände im DLA. Die Ausgabe der Galgenlieder von Christian Morgenstern im Verlag Bruno Cassirer von 1932 (vgl. [Exemplare im Katalog](https://www.dla-marbach.de/find/opac/id/AK00416805/?tx_find_find%5bau%5d=00605895%23tabaccess)) ist z.B. in fünf Autorenbibliotheken vorhanden. Was im Katalog spannende Schnittmengen sein können, ist bei einer gezielten (statistischen) Auswertung und Visualisierung von Provenienzspuren einer bestimmten Autorenbibliothek unerwünschter Beifang, der verfälscht.

Dieses Repository beinhaltet einen Prozess am Beispiel der Autorenbibliothek von Alfred Döblin, um die Daten nachträglich zu "putzen". Um den Prozess auf andere Autorenbibliotheken anzuwenden, muss nur der Identifier des gewünschten Teilbestands (z.B. `BF00019097`) im Script ausgetauscht werden. Der Prozess kann lokal, mit GitHub Codespaces oder mit GitHub Actions ausgeführt werden. Fragen dazu beantwortet gerne [Felix Lohmeier](https://github.com/felixlohmeier).
