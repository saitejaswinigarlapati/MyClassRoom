# Import socket module
import socket

# Create a TCP socket using IPv4
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server
client_socket.connect(("localhost", 5000))

# Inform user that connection is successful
print("Connected to server.")

# Infinite loop for continuous chatting
while True:
    # Take input from the client user
    msg = input("Client: ")

    # Send the message to the server
    client_socket.send(msg.encode())

    # If client types 'exit', stop communication
    if msg.lower() == "exit":
        break

    # Receive reply from the server
    reply = client_socket.recv(1024).decode()

    # If server sends 'exit', close connection
    if reply.lower() == "exit":
        print("Server disconnected.")
        break

    # Print server's reply
    print("Server:", reply)

# Close the client socket
client_socket.close()

# Inform user that connection is closed
print("Connection closed.")
