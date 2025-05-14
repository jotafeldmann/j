from http.server import HTTPServer, BaseHTTPRequestHandler
from http import HTTPStatus
import json
import time
from sys import argv


class _RequestHandler(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(HTTPStatus.OK.value)
        self.send_header('Content-type', 'application/json')
        # Allow requests from any origin, so CORS policies don't
        # prevent local development.
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    def do_GET(self):
        route = self.path[1:]
        params = route.split("/")
        endpoint = params[0]
        print({ endpoint })
        id = None
        if len(params) > 1:
            id = params[1]
        
        print({ "id": id })
        file_path = f"./endpoints/{endpoint}.json"
        http_code = 500
        http_response = ""
        
        try: 
            file_content = open(file_path)
            http_code = 200
            http_response = json.load(file_content)

            if id:
                found_id = (next(x for x in http_response if str(x['id']) == id))
                print({ "found_id": found_id })
                http_response = found_id
        
        except (StopIteration, IOError) as e:
            http_code = 404
            http_response = { "error": str(e) }
        except Exception as e:
            print(e)
            http_code = 500
            http_response = { "error": str(e) }
        finally:
            self.send_response(http_code)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            self.wfile.write(json.dumps(http_response).encode('utf-8'))

def run_server(port=8001):
    server_address = ('', port)
    httpd = HTTPServer(server_address, _RequestHandler)
    print('serving at %s:%d' % server_address)
    httpd.serve_forever()


if __name__ == '__main__':
    port= 8001 if len(argv) == 1 else int(argv[1])
    run_server(port)