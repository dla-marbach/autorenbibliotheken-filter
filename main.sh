# Download Autorenbibliothek vom DLA Datendienst

# wget https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019677 > input/titeldaten.json
# wget https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019677 > input/exemplare.json

# Import

orcli import json input/titeldaten.json --projectName "titeldaten" --rename
orcli import json input/exemplare.json --projectName "exemplare" --rename

# Spalten umbenennen nach dem Import in OpenRefine

orcli transform "titeldaten" config/titeldaten-umbenennen.json
orcli transform "exemplare" config/exemplare-umbenennen.json

# Im Projekt Titeldaten Verweise auf Exemplare entfernen, die nicht im Projekt Exemplare vorhanden sind

orcli transform "titeldaten" config/exemplare-filtern.json

# Export in JSON-Lines

orcli export jsonl "titeldaten" --mode records --output "output/titeldaten.jsonl"
orcli export jsonl "exemplare" --mode records --output "output/exemplare.jsonl"
