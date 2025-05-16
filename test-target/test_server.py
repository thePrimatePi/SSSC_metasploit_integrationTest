#!/usr/bin/env python3
import socket

HOST = '0.0.0.0'
PORT = 1337

print(f"Test server listening on {HOST}:{PORT}")

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print('Connected by', addr)
        while True:
            data = conn.recv(1024)
            if not data:
                break
            if b"crash" in data:
                conn.sendall(b"Server crashed!\n")
                break
            conn.sendall(b"OK: " + data)
