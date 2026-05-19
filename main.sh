# Import

orcli import tsv "https://dataservice.dla-marbach.de/v1/records?q=item_collection_id_mv:BF00019097&format=tsv" --projectName "titeldaten"
orcli import tsv "https://dataservice.dla-marbach.de/v1/records?q=collection_id_mv:BF00019097&format=tsv" --projectName "exemplare"

# Im Projekt Titeldaten Verweise auf Exemplare entfernen, die nicht im Projekt Exemplare vorhanden sind

orcli transform "titeldaten" config/verweise-filtern.json

# Export in JSON-Lines

orcli export jsonl "titeldaten" --separator "␟" --output "output/titeldaten.jsonl"
orcli export jsonl "exemplare" --separator "␟" --output "output/exemplare.jsonl"
