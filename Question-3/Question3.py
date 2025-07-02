from collections import defaultdict
import re

# Extract the URL path from an HTTP request string
def extract_request_path(request_str):
    # request_str example: '"GET /data/wasser/medium/30 HTTP/2.0"'
    match = re.match(r'"[A-Z]+\s([^ ]+)\sHTTP/[\d.]+"', request_str)
    if match:
        return match.group(1)
    return None

def analyze_log_file(filepath):
    total_requests_per_pod = defaultdict(int)
    response_code_summary = defaultdict(int)
    total_bytes_sent_per_pod = defaultdict(int)
    unique_request_paths = set()

    # Regex pattern to parse the log line parts we need
    log_pattern = re.compile(
        r'^(?P<pod>\S+) '              # pod name (non-space string)
        r'\S+ '                        # container name (ignored)
        r'\S+ '                        # IP address (ignored)
        r'.*?'                         # anything until the request
        r'\"(?P<request>[A-Z]+\s[^"]+\sHTTP/[\d.]+)\" '  # HTTP request string
        r'(?P<response_code>\d{3}) '   # response code (3 digits)
        r'(?P<bytes_sent>\d+)'         # bytes sent (digits)
    )

    with open(filepath, 'r') as f:
        for line in f:
            match = log_pattern.search(line)
            if not match:
                continue

            pod_name = match.group('pod')
            request_str = '"' + match.group('request') + '"'
            response_code = match.group('response_code')
            bytes_sent_str = match.group('bytes_sent')

            request_path = extract_request_path(request_str)
            if request_path is None:
                continue

            total_requests_per_pod[pod_name] += 1
            response_code_summary[response_code] += 1

            try:
                bytes_sent = int(bytes_sent_str)
            except ValueError:
                bytes_sent = 0
            total_bytes_sent_per_pod[pod_name] += bytes_sent

            unique_request_paths.add(request_path)

    return total_requests_per_pod, response_code_summary, total_bytes_sent_per_pod, unique_request_paths

if __name__ == "__main__":
    log_file = input("Enter file path - ")

    total_requests_per_pod, response_code_summary, total_bytes_sent_per_pod, unique_request_paths = analyze_log_file(log_file)

    print("Total requests per pod:")
    for pod, count in total_requests_per_pod.items():
        print(f"{pod}: {count}")

    print("\nResponse code summary:")
    for code, count in response_code_summary.items():
        print(f"{code}: {count}")

    print("\nTotal bytes sent per pod:")
    for pod, total_bytes in total_bytes_sent_per_pod.items():
        print(f"{pod}: {total_bytes}")

    print("\nUnique request paths:")
    for path in sorted(unique_request_paths):
        print(path)

