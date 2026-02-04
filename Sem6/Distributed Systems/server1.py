# Server
# import socket module
import socket

# Create TCP socket using IPv4
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind server to all interfaces on port 5000
server_socket.bind(("0.0.0.0", 5000))

# Enable server to accept single connection
server_socket.listen(1)


print("Waiting for client...")

# Accept new client connection
conn, addr = server_socket.accept()
print(f"Connected to client: {addr}")

# Infinite loop to keep chatting until exit is typed
while True:
    client_msg = conn.recv(1024).decode()
    
    # If client sends 'exit', terminate the connection
    if client_msg.lower() == "exit":
        print("Client disconnected.")
        break
    
    # Display client message
    print("Client:", client_msg)

    # server reply to client
    server_msg = input("Server: ")
    
    # sending reply to client
    conn.send(server_msg.encode())

    # If server sends 'exit', terminate the connection
    if server_msg.lower() == "exit":
        break

conn.close()
server_socket.close()
print("Server closed.")
