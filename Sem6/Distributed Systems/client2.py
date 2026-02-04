# Import socket module
import socket

# Create TCP socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to server (replace IP for network usage)
client_socket.connect(("localhost", 5000))

# Inform connection status
print("Connected to server.")

# Loop for continuous chat
while True:
    # Take input from client user
    msg = input("Client: ")

    # Send message to server
    client_socket.send(msg.encode())

    # Exit if client types 'exit'
    if msg.lower() == "exit":
        break

    # Receive reply from server
    reply = client_socket.recv(1024).decode()

    # Exit if server sends 'exit'
    if reply.lower() == "exit":
        print("Server disconnected.")
        break

    # Print server reply
    print("Server:", reply)

# Close the socket
client_socket.close()
print("Connection closed.")
