# Google Search Automation with Robot Framework

This project demonstrates a simple web automation test using **Robot Framework** and **SeleniumLibrary**. The test automates a Google search for the term `"robotframework"`, extracts the top visible search result links, logs them in the console, and writes them to a text file.

---

## Features

- Opens Google in a Chrome browser.
- Searches for the term `"robotframework"`.
- Captures the top search result links (filtered via anchor tags).
- Logs links to the console.
- Saves valid (non-empty) links to `results.txt`.
- Takes a screenshot of the results page.

---

## ⚙️ Prerequisites

- Python installed
- Chrome browser
- [ChromeDriver](https://sites.google.com/chromium.org/driver/) installed and added to system PATH
- Install dependencies using pip:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
