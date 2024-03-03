# Download Autorenbibliothek vom DLA Datendienst
# TODO: Aktivieren wenn CSV ohne Escaping verfügbar

# wget -O input/titeldaten.csv "https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019097&format=csv"
# wget -O input/exemplare.csv "https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019097&format=csv"

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
