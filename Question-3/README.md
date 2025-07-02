# Question3 - Log File Analyzer
This Python script analyzes an HTTP request log file to provide useful summaries about traffic handled by different pods in your infrastructure.

## Features
Counts total HTTP requests per ingress pod.

Summarizes the occurrence of each HTTP response code.

Calculates total bytes sent per pod.

Lists all unique request paths accessed.

## Requirements
Python 3.x

No external libraries needed (only built-in modules used).

## Input
Log file path

## Usage

### Run the script with Python3 
python3 Question4.py



Example Output
```bash
Total requests per pod:
ingress-nginx-controller-7b5855865f-7c8b4: 9

Response code summary:
404: 6
200: 3

Total bytes sent per pod:
ingress-nginx-controller-7b5855865f-7c8b4: 700220

Unique request paths:
/data/spirituosen/tabakwaren-spirituosen/3
/data/wasser/gourmet-wasser/30
/data/wasser/gourmet-wasser/12
/data/wasser/heilwasser/30
/data/wasser/medium/30
/data/wasser/spritzig/12
/data/wasser/still/30
