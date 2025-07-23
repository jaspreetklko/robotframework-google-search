# robotframework-google-search

This Robot Framework test case automates a Google search for the term **"robotframework"**, extracts non-empty result titles, and saves them to both the console and a text file.

## 📋 Test Objective

- Open [google.com](https://www.google.com)
- Search for **robotframework**
- Extract and print the text of the top search result titles (ignoring empty ones)
- Save the results to a file `results.txt`
- Take a screenshot of the results page


## ✅ Prerequisites

- [Python](https://www.python.org/downloads/) installed
- [Robot Framework](https://robotframework.org/) installed  
  ```bash
  pip install robotframework
