# Import socket module for networking
import socket

# Import threading module for concurrency
import threading

# Function to handle communication with a single client
def handle_client(conn, addr):
    # Print which client is connected
    print(f"[NEW CONNECTION] {addr} connected.")

    # Loop to continuously receive messages from this client
    while True:
        # Receive message from client (up to 1024 bytes)
        msg = conn.recv(1024).decode()

        # If client sends 'exit', disconnect
        if msg.lower() == "exit":
            print(f"[DISCONNECTED] {addr}")
            break

        # Display client's message
        print(f"Client {addr}: {msg}")

        # Server reply
        reply = input(f"Reply to {addr}: ")

        # Send reply to client
        conn.send(reply.encode())

        # If server sends 'exit', stop communication
        if reply.lower() == "exit":
            break

    # Close client connection
    conn.close()


# Create TCP socket using IPv4
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind server to all interfaces on port 5000
server_socket.bind(("0.0.0.0", 5000))

# Enable server to accept multiple connections
server_socket.listen()

# Inform server status
print("[SERVER STARTED] Waiting for connections...")

# Infinite loop to accept new clients
while True:
    # Accept new client connection
    conn, addr = server_socket.accept()

    # Create a new thread for each client
    client_thread = threading.Thread(
        target=handle_client,   # Function to run
        args=(conn, addr)       # Arguments passed to function
    )

    # Start the thread
    client_thread.start()

    # Print number of active connections
    print(f"[ACTIVE CONNECTIONS] {threading.active_count() - 1}")
