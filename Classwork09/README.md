## Classwork 9
### Part 1 
ARQ (*automatic repeat request*) is a stop and wait protocol. This protocol helps to ensure transmission reliability.If the link has errors, the receiving node needs to detect errors and confirm with an ACK packet that the current packet has been received. The source node does not transmit the next packet until an ACK has been received for the previous one. After a specific time of not receiving an ACK, the source times out and resends the packet. 
For this assignment, we ignore statistics and will abstract channel errors.
![myARQ1 Model](https://github.com/nicomcd/OMNeT/blob/main/src/classwork91.png)
![myARQ1 t=0](https://github.com/nicomcd/OMNeT/blob/main/src/classwork92.png)
![myARQ1 t=10](https://github.com/nicomcd/OMNeT/blob/main/src/classwork93.png)

### Part 2
For this part, we create a variable for probability of error of the packet which is 0.9.
![myARQ1 probability ini file](https://github.com/nicomcd/OMNeT/blob/main/src/classwork9ini.png)
![myARQ1 probability t=0](https://github.com/nicomcd/OMNeT/blob/main/src/classwork9t0.png)
![myARQ1 probability t=10](https://github.com/nicomcd/OMNeT/blob/main/src/classwork9t10.png)
