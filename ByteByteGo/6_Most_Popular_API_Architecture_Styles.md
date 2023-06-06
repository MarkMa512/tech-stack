# [Top 6 API Architecture Styles](https://www.youtube.com/watch?v=4vLxWqE94l4)

### 1. SOAP (Simple Object Access Protocol): XML-based, for 
- XML-based enterprise messaging protocol for exchanging structured information 
- Heavyweight protocol, more complex, more verbose, more difficult to parse 
- Mostly used in financial services and payment gateways, where **security** and **reliability** are more important than **performance** and **scalability** 


### 2. RESTful(Representational State Transfer): Resource-based, for web servers 
- Resource-based architecture style for web services 
- Backbone of the modern web, popular and easy to implement, built on top of HTTP protocol 
- Not suitable for real-time data or highly connected data models
- Suitable for CRUD operations


### 3. GraphQL (Graph Query Language): Query language, reduces network loads
- Query language for APIs and runtime for fulfilling those queries with existing data 
- Developed by Facebook in 2012, open-sourced in 2015
- Allows client to ask for exactly what they need and nothing more 
- No over-fetching or under-fetching of data, leading to more efficient API calls and network usage 
- Suitable for complex data requirements, real-time data, and highly connected data models
- Used by Facebook, GitHub, Shopify, Twitter, Yelp, Pinterest, and many more 
- Come with steep learning curve, not suitable for beginners 
- Requires more server-side resources than RESTful APIs to achieve the flexible query capabilities 


### 4. gRPC (Remote Procedure Call): High-performance, for microservices
- Uses HTTP/2 for transport, Protocol Buffers for messaging by default 
- High-performance, bi-directional, and highly efficient 
- Netflix uses gRPC to handle their immense inter-service communication 
- **Limited browser support**, not suitable for browser-based applications 

### 5. WebSocket: Bidirectional, for low-latency data exchange 
- Real-time, bidirectional, persistent connections between applications 
- Perfect fit for live chat, real-time gaming where low latency data exchange is required
- Not suitable if no need for real-time data exchange as websocket connections are more expensive to maintain than HTTP connections

### 6. Webhook: Asynchronous, for event-driven applications 
- Uses HTTP protocol (HTTP callbacks)to deliver data to a specific URL when an event occurs 
- Suitable for event-driven applications, such as chatbots, payment gateways, and IoT devices
- Not suitable for real-time data exchange, synchronous communication and requires immediate response as webhooks are asynchronous and not real-time
- Github uses webhooks to notify external services when certain events occur, such as pushing code to a repository or creating a pull request

### Comparison Table 

| API Architecture Style | Protocol | Data Format | Transport | Use Cases | Pros | Cons |
| --- | --- | --- | --- | --- | --- | --- |
| SOAP | HTTP, SMTP, TCP | XML | HTTP, SMTP, TCP | Financial services, payment gateways | Security, reliability | Performance, scalability |
| RESTful | HTTP | JSON, XML, HTML, plain text, PDF, JPEG, etc. | HTTP | CRUD operations | Simplicity, flexibility, scalability | Not suitable for real-time data or highly connected data models |
| GraphQL | HTTP | JSON, XML, HTML, plain text, PDF, JPEG, etc. | HTTP | Complex data requirements, real-time data, highly connected data models | Efficient API calls, network usage | Steep learning curve, more server-side resources |
| gRPC | HTTP/2 | Protocol Buffers | HTTP/2 | Microservices | High-performance, bi-directional, highly efficient | Limited browser support |
| WebSocket | HTTP | JSON, XML, HTML, plain text, PDF, JPEG, etc. | HTTP | Real-time data exchange | Low latency data exchange | Not suitable if no need for real-time data exchange |
| Websocket | HTTP | JSON, XML, HTML, plain text, PDF, JPEG, etc. | HTTP | Real-time data exchange | Low latency data exchange | Not suitable if no need for real-time data exchange |
| Webhook | HTTP | JSON, XML, HTML, plain text, PDF, JPEG, etc. | HTTP | Event-driven applications | Asynchronous, event-driven | Not suitable for real-time data exchange, synchronous communication and requires immediate response |

