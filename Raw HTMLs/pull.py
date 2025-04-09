import requests
from requests.auth import HTTPBasicAuth

# Define the base URL pattern (modify if necessary)
base_url = "https://www2.hawaii.edu/~fuleky/econ628/_book/chapters/chap{}.html"

# Define login credentials
username = "econ628"
password = "student"

# Start a session for authentication
session = requests.Session()
session.auth = HTTPBasicAuth(username, password)

# Loop through chapters 16 to 26
for chapter in range(16, 27):  # 27 because range is exclusive at the end
    chapter_url = base_url.format(chapter)
    response = session.get(chapter_url)

    # Check if the request was successful
    if response.status_code == 200:
        print(f"Successfully pulled Chapter {chapter}")

        # Save the HTML content
        with open(f"chapter_{chapter}.html", "w", encoding="utf-8") as file:
            file.write(response.text)
    else:
        print(f"Failed to pull Chapter {chapter}: HTTP {response.status_code}")
