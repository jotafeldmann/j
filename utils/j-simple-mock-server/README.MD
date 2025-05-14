# J Simple Mock Server

## Usage

1. Add endpoints
```bash
cd endpoints
# Add JSON files to the endpoints folder
# where file name = endpoint
# Example
# endpoints/companies.json = /companies
# id: 1 = /companies/1
```

2. Start the server
```bash
python server.py 3000
```

3. Make endpoint public (to candidate)
- Go to PORTS tab (by default at the bottom or CTRL + SHIFT + P, search for "Ports: Focus on Ports View")
- Right click on PORT that is showing (e.g. PORT 3000)-> Set Visibility -> Public

4. Test if its working
```bash
python test_server.py 
# You must see `Data: {'success': True} `
# or using the Forwarded Address from PORTS
curl $YOUR_FORWARDED_ADDRESS/healtheck
```