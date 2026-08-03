import requests
from dotenv import dotenv_values, load_dotenv

# geting keys
KEYS = dotenv_values(".env")


# Notion
NOTION_VERSION = "2026-03-11"
NOTION_API_URL = "https://api.notion.com/v1/"

flags = {"users": "users"}

url = f"{NOTION_API_URL}/{flags['users']}/{KEYS['NOTION_LIBRARY']}/query"

payload = {"page_size": 100}

headers = {
    "Notion-Version": f"{NOTION_VERSION}",
    "Authorization": f"Bearer {KEYS['NOTION_KEY']}",
}

response = requests.post(url, json=payload, headers=headers)

url = f"https://api.notion.com/v1/data_sources/{KEYS['NOTION_LIBRARY']}/query"

payload = {
    "page_size": 123,
    "Notion-Version": f"{NOTION_VERSION}",
    "Authorization": f"Bearer {KEYS['NOTION_TOKEN']}",
}

response = requests.post(url, json=payload, headers=headers)

from pprint import pprint

a = response.json()
pprint(a)

# Obsidian
## test if is running
## if not, runn obs CLI first
## After, acesse the "API"
