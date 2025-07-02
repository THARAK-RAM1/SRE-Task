import requests

def getMovieTitles(substr):
    base_url = 'https://jsonmock.hackerrank.com/api/movies/search/'
    titles = []
    page = 1

    while True:
        # Send GET request with query substring and current page
        params = {'Title': substr, 'page': page}
        response = requests.get(base_url, params=params)

        # Check for HTTP success code
        if response.status_code != 200:
            raise Exception(f"Failed to fetch data: HTTP {response.status_code}")

        # Filter JSON response
        data = response.json()
        for movie in data.get('data', []):
            titles.append(movie['Title'])

        # Check for the last page
        if page >= data.get('total_pages', 0):
            break
        page += 1

    # Sort titles in ascendeing order
    titles = list(set(titles))
    titles.sort()
    return titles


if __name__ == "__main__":
    substr =  substr = input("Enter the substring to search -  ")
    result = getMovieTitles(substr)
    for title in result:
        print(title)

