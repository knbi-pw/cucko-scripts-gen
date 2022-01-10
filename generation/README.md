Skrypt parse_pcap.sh:  
- Wywołuje się z cli linuxa. Domyślny adres w skrypcie to http://localhost:9001/analysis i lączy się do lokalnego serwera web cuckoo. 

- Aby wywołać skrypt nalezy podać zakres. Na przykład,  w celu pobrania pcapow z analiz od 20 do 25 wedle numeracji na listingu serwera cuckoo skrypt wywoływany jest: parsepcap.sh 20 25 

- W celu pobrania 1 pliku, obie liczby muszą być podane i być identyczne. 

- Skrypt samoczynnie pobiera pcapy poprzez odwołania do bazy danych mongo za posrednictwem serwera www cuckoo.

- Skrypt pobiera pcap danej analizy z checksumą md5 malware, który był analizowany jako nazwa PCAP-a

- Skrypt tworzy plik tekstowy z podsumowaniem wykonanych operacji o nazwie summary.txt w formacie PCAP #: "$i" URL: "$FP "FILE MD5: "$MD5 gdzie i to numer analizy a FP to lokalizacja pcap względem ścieżki serwera cuckoo 

- Plik towrzony jest w obecnym katalogu roboczym.

Skrypt drop_malware.sh:

- Łączy się z serwisem Malshare.com [via API, konieczne podanie swojego klucza, poprzez edycję skryptu!] i pobiera dzienną paczkę malware do folderu /mnt/sdb2/MAGAZINE/ARMED

- Następnie skrpt kolejkuje zadania do klastra cuckoo i je wykonuje

- Skrypt wymaga pliku binarnego wget_malshare_daily w lokacji /usr/bin do poprawnego działania

- Skrypt jest wykonywany przez cron, tak więc nie wspiera obecnie przyjmowania parametrów i pipe-ów, w celu zapewnienia kompatybilności

! Skrypty poniżej  NIE  są aktywne ze względu na zmiany w API Malware Bazaar! Zostały uokumentowane dla celów historycznych !

Skrypt bazaar_get-from-date.sh :

- Pobierał do folderu mnt/sdb2/MAGAZINE/ARMED repozytoria malware z  Malware Bazaar 

- Pobierane wszystkie repozytoria od daty określonej w skrypcie do dnia aktualnego -1 (repozytorium miało opóźnienie 24h w publikacji)

- Po zakończeniu pobierania maware był dzielony na foldery z datą i kolejkowany do instancji cuckoo

Skrypt drop_bazaar-yesterday-only.sh:

- Działa funkcjonalnie tak samo jak powyższy, jedynie z ograniczeniem daty tylko do dnia poprzedniego
 
