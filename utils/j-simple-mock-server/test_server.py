import sys
import requests

def test_url(base, url):
    print(f"- Testing GET /{url}")
    return requests.get(f'{base}/{url}')

def success():
    print("-- Success")
    print("")
    
def failed(response):
    print("-- Failed")
    print(f"Response status code: {response.status_code}")
    print(f"Response text: {response.text}")
    print("")

def test_server(base):
    print("")
    print("Testing server at:", base)
    print("")

    response = test_url(base, "healthcheck")
    if response.status_code == 200 and response.json() == {"success": True}:
        success()
    else:
        failed(response)
        
    response = test_url(base, 'students')
    if response.status_code == 200:
        success()
    else:
        failed(response)
        
    response = test_url(base, 'students/1')
    if response.status_code == 200 and response.json() == {"id": 1, "name": "Alice"}:
        success()
    else:
        failed(response)

    response = test_url(base, 'invalid_endpoint')
    if response.status_code == 404:
        success()
    else:
        failed(response)


if __name__ == '__main__':
    base = "http://localhost:3000" if len(sys.argv) == 1 else sys.argv[1]
    test_server(base)
