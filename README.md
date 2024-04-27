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
Config1
![Config1](https://github.com/nicomcd/OMNeTpp/assets/35404943/34eb905d-fbe0-471e-b303-845bca76d6f3)
Config2
![Config2](https://github.com/nicomcd/OMNeTpp/assets/35404943/cf472124-e3d6-4fed-b9bb-b7b1dfd4af41)
Config3
![Config3](https://github.com/nicomcd/OMNeTpp/assets/35404943/89da3c7d-3871-4285-9fc0-19b12080740c)
Config4
![Config4](https://github.com/nicomcd/OMNeTpp/assets/35404943/307f9f29-2f88-4bae-9730-014c7e7c7819)
Config5
![Config5](https://github.com/nicomcd/OMNeTpp/assets/35404943/18eab57a-e139-46ab-8076-5b202bab1f7c)
Config6
![Config6](https://github.com/nicomcd/OMNeTpp/assets/35404943/f04f75a5-336d-49af-8cb7-b979f51fd0ce)
Config7
![Config7](https://github.com/nicomcd/OMNeTpp/assets/35404943/a0b88c84-84f2-4fda-8305-c03b73e97151)
Config8
![Config8](https://github.com/nicomcd/OMNeTpp/assets/35404943/eebd1cf4-ab02-4126-a20e-e2a60dda51ac)
Config9
![Config9](https://github.com/nicomcd/OMNeTpp/assets/35404943/95953193-b8a6-461e-9ca8-fd58450c3f67)
![Queueing Network](https://github.com/nicomcd/OMNeTpp/assets/35404943/6c950c3a-0d22-492c-a3e4-1944f1bb24d5)

![r and W](https://github.com/nicomcd/OMNeTpp/assets/35404943/78b097fb-60e0-49bd-b74b-5e4bc086b03f)

The best performance metric would be r = {0.0,0.8,0.9} the resulting mean queue time for all customers is a lot less. This would manipulate the probability of the amount of high priority customers and low priority customers.

## Classwork 14
We are interested in creating a network of queues, where the source generates Poisson arrivals and first queue has exponential service time (M/M/1), the initial queue output is routed with prob p1=0.25 to another M/M/1 queue and rest exit the system.

![display](https://github.com/nicomcd/OMNeTpp/assets/35404943/ba2dd8e9-b4fc-4f6d-a9ac-910bdf8e7322)
![references](https://github.com/nicomcd/OMNeTpp/assets/35404943/ebf8b3ab-2011-4995-8555-0bc594d8517d)
You have to update the code in Router.cc in the queueing lib before continuing:
![router.cc](https://github.com/nicomcd/OMNeTpp/assets/35404943/4d6d7eae-fd80-49f7-8359-e8207fab9104)

![ini](https://github.com/nicomcd/OMNeTpp/assets/35404943/c90a4267-abde-4f6f-b96a-89aa6f73879a)
![express run](https://github.com/nicomcd/OMNeTpp/assets/35404943/335d5ee7-1979-49fa-99f6-fce943974902)
![simulation results](https://github.com/nicomcd/OMNeTpp/assets/35404943/b695bd6f-a901-4635-b6ad-71a8c0c44051)
