from dotenv import load_dotenv, dotenv_values
import requests

# geting keys
KEYS = dotenv_values('.env')


# Notion
NOTION_VERSION = "2026-03-11"
NOTION_API_URL = "https://api.notion.com/v1/blocks/"

url = f"{NOTION_API_URL}{KEYS['NOTION_MAIN']}/children"

headers = {
    "Notion-Version": f"{NOTION_VERSION}",
    "Authorization": f"Bearer {KEYS['NOTION_KEY']}"
}
response = requests.get(url, headers=headers)

print(response.text)

# Obsidian
## test if is running
## if not, runn obs CLI first
## After, acesse the "API"
