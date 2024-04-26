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
![fast](https://github.com/nicomcd/OMNeTpp/assets/35404943/eb296aef-6274-414c-ade4-62b2f4ca61b6)
Queue M/M/1 for 1000 jobs
![121](https://github.com/nicomcd/OMNeTpp/assets/35404943/022388d0-4c9f-41ff-9707-af83121edc95)
Queue M/D/1 for 1000 jobs
![122](https://github.com/nicomcd/OMNeTpp/assets/35404943/601cf548-912e-4e5d-bb51-0d87d5793ffc)
Queue M/M/1 for 1000000 jobs
![123](https://github.com/nicomcd/OMNeTpp/assets/35404943/4f142a76-b7e2-4868-b60a-1341f17ce615)
Queue M/D/1 for 1000000 jobs
![124](https://github.com/nicomcd/OMNeTpp/assets/35404943/4c5d564b-fca8-4929-a008-b48d7b32143a)

## Classwork 13
We are interested in simulating a queueing network that mimics the waiting line for a single park ride for high and low priority customers.
![display](https://github.com/nicomcd/OMNeTpp/assets/35404943/0d7efe78-453c-4f01-bfa4-3df8608a1bfa)
This is how to change the ini source code:
![ini](https://github.com/nicomcd/OMNeTpp/assets/35404943/6553d352-357a-4c2e-baac-57b9de0dadce)

Config0
![Config0](https://github.com/nicomcd/OMNeTpp/assets/35404943/3acdf229-bb82-4419-84fe-bb73a1445263)


