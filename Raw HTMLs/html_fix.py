import os
from bs4 import BeautifulSoup

# Set your folder path
folder_path = r"C:\Users\Degree Laptop\Desktop\Spring 2025\1 - Econ 628 (Econometrics)\Raw HTMLs"

# Process each HTML file in the folder
for filename in os.listdir(folder_path):
    if filename.endswith(".html"):
        file_path = os.path.join(folder_path, filename)

        # Parse the HTML
        with open(file_path, "r", encoding="utf-8") as file:
            soup = BeautifulSoup(file, "html.parser")

        # Remove the Table of Contents (TOC)
        toc = soup.find("nav", {"id": "TOC"})
        if toc:
            toc.decompose()

        # Remove sidebar chapter list (div id="quarto-sidebar")
        sidebar = soup.find("div", {"id": "quarto-sidebar"})
        if sidebar:
            sidebar.decompose()

        # Optional: Remove any other sidebar/menu divs
        other_navs = soup.find_all("nav")
        for nav in other_navs:
            nav.decompose()

        # Save cleaned version
        cleaned_file_path = os.path.join(folder_path, filename.replace(".html", ".html"))
        with open(cleaned_file_path, "w", encoding="utf-8") as file:
            file.write(str(soup))

        print(f"✅ Cleaned {filename} → {cleaned_file_path}")

print("🚀 All files processed successfully!")
