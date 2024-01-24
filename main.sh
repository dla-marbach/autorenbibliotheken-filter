# Download Autorenbibliothek vom DLA Datendienst
# TODO: Aktivieren wenn Datendienst öffentlich verfügbar

# wget https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019677&format=csv > input/titeldaten.csv
# wget https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019677&format=csv > input/exemplare.csv

# Import

orcli import csv input/titeldaten.csv --projectName "titeldaten"
orcli import csv input/exemplare.csv --projectName "exemplare"

# Im Projekt Titeldaten Verweise auf Exemplare entfernen, die nicht im Projekt Exemplare vorhanden sind

orcli transform "titeldaten" config/verweise-filtern.json

# Beispiel für Anreicherung weiterer Exemplardaten

orcli transform "titeldaten" config/exemplardaten-anreichern.json

# Export in JSON-Lines

orcli export jsonl "titeldaten" --separator "␟" --output "output/titeldaten.jsonl"
orcli export jsonl "exemplare" --separator "␟" --output "output/exemplare.jsonl"
