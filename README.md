# OMNeTpp IDE
For the class CPE 345 - Modeling and Simulation, we utilize the OMNeT ++ IDE, which is based on the Eclipse platform. This software is for editing and building simulations. The network topology is specified using the NED language, which is made up of simple and compound models, channels, gates, etc. The .ned files are translated into C++ code by the NEDC compiler, then compiled by the C++ compiler and linked to the simulation executable.

## Classwork 8
Implementing a simple example with three nodes in the network description. As part of the assignment, we also enchance the channel parameters by adding a delay of 100 ms on all connections.  
![3 Nodes](https://github.com/nicomcd/OMNeT/blob/main/src/Classwork8.png)

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

## Classwork 10
Save messages that the source creates as a packet and send a copy of the packet. Implement the bit error probability of the channel directly. Add a limit parameter at an appropriate module to send on a limit number of packet transmissions.
![source](https://github.com/nicomcd/OMNeTpp/assets/35404943/2d3d5f87-52d5-47a2-a9dc-b532a23c8e62)
![ini](https://github.com/nicomcd/OMNeTpp/assets/35404943/e64f43e2-c4a1-40ae-9973-fe63e26613b6)
![t=0](https://github.com/nicomcd/OMNeTpp/assets/35404943/4ebc9d35-3d7a-4484-a698-fa3c3897b03f)
![when limit is reached](https://github.com/nicomcd/OMNeTpp/assets/35404943/f60fcee6-b663-460b-802e-35b7a56f313e)

## Classwork 11
Collect the "delay" statistics (encountered by each packet due to bit errors and retransmissions) of 100 packets using the tools described in the lecture, track all transmissions. View the histogram and capture it.

![Histogram](https://github.com/nicomcd/OMNeTpp/assets/35404943/56423178-8158-4f21-b561-399752fec159)

## Classwork 12
A simple queue implementation that uses the source, queue, and sink modules from [SimpleQueue.ned](https://github.com/omnetpp/omnetpp/tree/master/samples)
Make sure to link the queueinglib to the project.
![Editing Project Features](https://github.com/nicomcd/OMNeTpp/assets/35404943/3af62b70-548e-47b5-85ec-22f78e97226c)
![Referencing queueinglib](https://github.com/nicomcd/OMNeTpp/assets/35404943/bc48e090-e991-4425-9478-922f56a8307d)
To run the simulation faster there are a number of different options.
![Fast Run](https://prod-files-secure.s3.us-west-2.amazonaws.com/49d3b3b7-abdc-4131-9065-817d195795a0/0c2c182d-63bc-4bc1-9616-121549c1b888/Untitled.png)
Queueing for 1000 jobs M/M/1 and its results.
![M/M/1](https://prod-files-secure.s3.us-west-2.amazonaws.com/49d3b3b7-abdc-4131-9065-817d195795a0/6ccfa33a-b5ba-41fb-aea5-d7b7e95ef82a/Untitled.png)
Queueing for 1000 jobs M/D/1 and its results.
![M/D/1](https://prod-files-secure.s3.us-west-2.amazonaws.com/49d3b3b7-abdc-4131-9065-817d195795a0/cd745fcb-1be1-4a09-8ca2-58fe9a9c6913/Untitled.png)
Queueing for 1000000 jobs M/M/1 and its results.
![M/M/1 1000000](https://prod-files-secure.s3.us-west-2.amazonaws.com/49d3b3b7-abdc-4131-9065-817d195795a0/f25bfb4a-71d6-4426-ad66-db36012917bb/Untitled.png)
Queueing for 1000000 jobs M/M/1 and its results.
![M/D/1 1000000](https://prod-files-secure.s3.us-west-2.amazonaws.com/49d3b3b7-abdc-4131-9065-817d195795a0/fa07978a-8dc5-456a-ace0-3ec6e7b39870/Untitled.png)
