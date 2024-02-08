# What happens when you type https://www.google.com in your browser and press Enter?

This is a blog post that explains the main steps involved in the web stack and the internet when you type https://www.google.com in your browser and press Enter. It covers the following topics:

- DNS request
- TCP/IP
- Firewall
- HTTPS/SSL
- Load-balancer

## Table of Contents

- [Introduction](#introduction)
- [DNS request](#dns-request)
- [TCP/IP](#tcpip)
- [Firewall](#firewall)
- [HTTPS/SSL](#httpsssl)
- [Load-balancer](#load-balancer)
- [Conclusion](#conclusion)

## Introduction
Have you ever wondered how the web works? How does your browser know how to display the Google homepage when you type https://www.google.com in the address bar and press Enter? What are the steps involved in this seemingly simple process? In this blog post, I will try to answer these questions by giving you a high-level overview of the main components and protocols involved in the web stack and the internet.
## DNS request
The first step is to resolve the domain name https://www.google.com to an IP address. An IP address is a unique identifier for a device or a server on the internet. For example, 172.217.14.206 is one of the IP addresses for Google. However, humans are not good at remembering numbers, so we use domain names instead, which are easier to remember and type.

To resolve a domain name to an IP address, your browser needs to ask a DNS server. DNS stands for Domain Name System, and it is a distributed database that maps domain names to IP addresses. Your browser usually uses the DNS server provided by your internet service provider (ISP), but you can also configure it to use a different one, such as Google DNS (8.8.8.8) or Cloudflare DNS (1.1.1.1).

Your browser sends a DNS query to the DNS server, asking for the IP address of https://www.google.com. The DNS server may not have the answer in its cache, so it may need to ask other DNS servers in a hierarchical manner until it finds the authoritative DNS server for the domain. The authoritative DNS server is the one that has the final and definitive answer for the domain. Once the DNS server gets the answer, it sends it back to your browser, along with a time-to-live (TTL) value, which indicates how long the answer can be cached by the DNS server or your browser.

## TCP/IP
The next step is to establish a TCP connection between your browser and the server. TCP stands for Transmission Control Protocol, and it is one of the core protocols of the internet. TCP provides a reliable, ordered, and error-checked delivery of data between applications running on different devices. TCP uses a three-way handshake to establish a connection. This means that your browser and the server exchange three messages to agree on the parameters of the connection, such as the port number, the sequence number, and the window size. The port number is a number that identifies a specific application or service on a device. For example, port 80 is usually used for HTTP, and port 443 is usually used for HTTPS. The sequence number is a number that identifies the order of the data segments sent over the connection. The window size is a number that indicates how much data can be sent before waiting for an acknowledgment.

Your browser initiates the TCP connection by sending a SYN (synchronize) message to the server, with a random initial sequence number (ISN). The server responds with a SYN-ACK (synchronize-acknowledge) message, with its own ISN and the acknowledgment number set to the browser’s ISN plus one. The browser then sends an ACK (acknowledge) message, with the acknowledgment number set to the server’s ISN plus one. At this point, the TCP connection is established, and both sides can start sending data.

## Firewall
Before your browser can send any data to the server, it may need to pass through a firewall. A firewall is a software or hardware device that monitors and filters the incoming and outgoing network traffic based on predefined rules. A firewall can block, allow, or modify the traffic based on various criteria, such as the source and destination IP addresses, the port numbers, the protocol, or the content. A firewall can be installed on your device, on your router, on your ISP, or on the server.

A firewall can prevent unauthorized access to your device or the server, protect against malicious attacks, or enforce certain policies. For example, a firewall can block access to certain websites, such as gambling or adult sites, or restrict the bandwidth usage of certain applications, such as video streaming or file sharing. A firewall can also encrypt or decrypt the traffic, depending on the configuration.

If your browser’s request passes through the firewall, it can proceed to the next step. If not, the firewall may drop the request, send back an error message, or redirect the request to a different destination.

## HTTPS/SSL
The next step is to secure the communication between your browser and the server using HTTPS and SSL. HTTPS stands for Hypertext Transfer Protocol Secure, and it is an extension of HTTP that adds encryption and authentication to the data transfer. SSL stands for Secure Sockets Layer, and it is a protocol that provides the encryption and authentication for HTTPS. SSL has been superseded by TLS (Transport Layer Security), but the term SSL is still widely used.

HTTPS and SSL work together to ensure that the data you send and receive from the server is confidential, authentic, and integral. Confidentiality means that no one can eavesdrop on your communication and read your data. Authenticity means that you can verify the identity of the server and make sure you are not talking to an impostor. Integrity means that you can detect any tampering or modification of your data.

To achieve these goals, HTTPS and SSL use a combination of symmetric and asymmetric encryption, digital signatures, and certificates. Symmetric encryption uses the same key to encrypt and decrypt the data, and it is fast and efficient. Asymmetric encryption uses a pair of keys, one public and one private, to encrypt and decrypt the data, and it is slow and complex. Digital signatures use asymmetric encryption to verify the identity and integrity of the data. Certificates are digital documents that contain the public key and other information about the server, and they are issued and signed by a trusted third-party authority, such as VeriSign or Let’s Encrypt.

The process of establishing a secure HTTPS connection using SSL is called the SSL handshake, and it involves the following steps:

Your browser sends a ClientHello message to the server, indicating the SSL version, the cipher suites, and the compression methods it supports, as well as a random number.
The server responds with a ServerHello message, selecting the SSL version, the cipher suite, and the compression method to use, as well as another random number. The server also sends its certificate and optionally requests the browser’s certificate for mutual authentication.
Your browser verifies the server’s certificate by checking its validity, its signature, and its issuer. If the certificate is valid, your browser extracts the server’s public key from the certificate. If the certificate is invalid, your browser may warn you or abort the connection.
Your browser generates a pre-master secret, which is a random number, and encrypts it with the server’s public key. Your browser sends the encrypted pre-master secret to the server.
The server decrypts the pre-master secret with its private key. Both your browser and the server use the pre-master secret and the two random numbers to derive the master secret, which is another random number. The master secret is used to generate the symmetric encryption key, the MAC (Message Authentication Code) key, and the IV (Initialization Vector) for both sides of the communication.
Your browser sends a ChangeCipherSpec message to the server, indicating that it will switch to the symmetric encryption mode. Your browser also sends a Finished message, which is a MAC of the previous handshake messages, encrypted with the symmetric key.
The server sends a ChangeCipherSpec message to your browser, indicating that it will also switch to the symmetric encryption mode. The server also sends a Finished message, which is a MAC of the previous handshake messages, encrypted with the symmetric key.
Your browser and the server verify the Finished messages by decrypting them and comparing the MACs. If they match, the SSL handshake is completed, and the secure HTTPS connection is established. Your browser and the server can now exchange data, encrypted with the symmetric key and authenticated with the MAC key.

## Load-balancer
The next step is to reach the server that can handle your request. However, there may not be just one server, but many servers that work together to provide the same service. This is called a server cluster, and it is a common way to improve the performance, scalability, and reliability of a web service. A server cluster can handle more traffic, distribute the workload, and recover from failures.

To manage a server cluster, a load-balancer is used. A load-balancer is a device or a software that distributes the incoming requests to the available servers in the cluster, based on some criteria, such as the server load, the server capacity, the server location, or the request type. A load-balancer can also monitor the health and status of the servers, and add or remove servers as needed.

There are different types of load-balancers, such as hardware load-balancers, software load-balancers, or DNS load-balancers. Hardware load-balancers are physical devices that are installed in front of the server cluster, and they use specialized hardware and software to perform the load-balancing. Software load-balancers are applications that run on a server, and they use standard hardware and software to perform the load-balancing. DNS load-balancers are DNS servers that resolve the domain name to different IP addresses, depending on the load-balancing criteria.
## Conclusion
In this blog post, I have explained what happens when you type https://www.google.com in your browser and press Enter. I have covered the following steps:

DNS request: Your browser resolves the domain name to an IP address by asking a DNS server.
TCP/IP: Your browser establishes a TCP connection with the server by exchanging three messages.
Firewall: Your browser’s request may pass through a firewall that filters the network traffic based on predefined rules.
HTTPS/SSL: Your browser secures the communication with the server using HTTPS and SSL, which provide encryption and authentication using symmetric and asymmetric encryption, digital signatures, and certificates.
Load-balancer: Your browser reaches the server that can handle your request, which may be part of a server cluster that is managed by a load-balancer.
By understanding these steps, you can gain a better insight into how the web works and how the web stack and the internet interact. You can also learn about the various components and protocols that are involved in the web stack and the internet, and how they provide performance, scalability, reliability, security, and functionality for the web service.

I hope you enjoyed reading this blog post and learned something new. If you have any questions or feedback, please feel free to leave a comment below. Thank you for your attention. 👋
