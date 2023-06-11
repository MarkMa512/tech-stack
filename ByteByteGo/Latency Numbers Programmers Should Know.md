# 1. [Latency Numbers Programmers Should Know](https://www.youtube.com/watch?v=FqR5vESuKe0)

Latency numbers in 2020s

## Time unites:

- 1 ns = 1 nanosecond = 10^-9 seconds = 1/1 billionth of a second
- 1 us = 1 microsecond = 10^-6 seconds = 1/1 millionth of a second
- 1 ms = 1 millisecond = 10^-3 seconds = 1/1 thousandth of a second

## Sub-nanosecond 
- Accessing CPU register: 0.1 ns 
- Accessing L1 cache reference: 0.5 ns 
- CPU Clock cycle (at 1 GHz): 1 ns 


## 1-10 nanoseconds 
- Accessing L2 cache reference: 7 ns 
- Expensive CPU branch mispredict penalty: 10 ns (up to 20 CPU clock cycles) 

## 10-100 nanoseconds 
- Accessing L3 cache reference: 12 ns 
- Accessing main memory reference: 100 ns 

## 100-1000 nanoseconds (1 microsecond)
- System Call on Linux: several hundred nanoseconds 
    - Direct cost of the trap into the kernel and back to user space 
    - Does not include time to context switch and return from kernel and the execution of the system call itself 
- MD5 hash on 64-bit number: ~ 200 ns 

## 1-10 microseconds 
- Context switching between Linux threads: several microseconds 
    - Best case scenario 
- Memory copy of 64 KB on Linux: ~ 3 microseconds 

## 10-100 microseconds
- Nginx take about 50 microseconds to process a typical HTTP request 
- Read 1 MB sequentially from memory: ~ 50 microseconds (RAM speed of 20 GB/s)
- Read an 8K page on SSD takes about 100 microseconds (SSD speed of 80 MB/s)

## 100-1000 microseconds (1 millisecond) 
- SSD write latency = ~ 10 time of SSD read latency, it takes about 1 millisecond to write an 8K page on SSD 
- Intra-zone networking round trip in modern cloud provider: a few hundred microseconds 
    - Some may clock in < 100 microseconds 
- A typical Memcache / Redis get operation: ~ 1 millisecond measured from the client side (Including the network round trip time mentioned above) 

## 1-10 milliseconds
- Inter-zone networking round trip in modern cloud provider: a few milliseconds 
- Seek time for a rotational magnetic disk: 3-9 milliseconds 

## 10-100 milliseconds 
- Network round trip within North America: 10-50 milliseconds
- Reading 1GB from memory sequentially: ~ 10 milliseconds


## 100-1000 milliseconds (1 second) 
- bcrypt a password: 300ms 
- TLS handshake: 250ms - 500ms 
    - Has several round trips between the client and the server, depending on the distance between them 
- Network round trip between US West Coast to Singapore: 200-300 milliseconds 
- Reading 1GB sequentially from SSD: ~ 300 milliseconds 

## 1 second - 10 seconds
- Transfer 1GB  over the network within the same region: 2-10 seconds