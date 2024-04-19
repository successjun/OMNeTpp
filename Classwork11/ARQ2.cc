#include <stdio.h>
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

int msgcount =0;

class Source : public cSimpleModule
{
    private :
        simtime_t timeout; // timeout for source
        cPacket *timeoutEvent; // to the timeout self-message
    public:
        Source();
        virtual ~Source();
    protected :
        virtual void initialize() override;
        virtual void handleMessage(cMessage*msg) override;
};

Define_Module(Source);


Source::Source()
{
    timeoutEvent = nullptr;
}
Source::~Source()
{
    cancelAndDelete(timeoutEvent);
}

void Source::initialize()
{
    timeout = 1.0; //we will initialize the timeout to 1.0
    timeoutEvent = new cPacket("timeoutEvent"); //schedule the first timeout event for the first packet
    // Generate and send initial message.
    EV << "Sending initial message\n";
    cPacket *msg = new cPacket("packet");
    msg->setBitLength(8);
    cPacket*copy=msg->dup();
        send(msg, "out");
        msgcount++;
    scheduleAt(simTime()+timeout, timeoutEvent);
}

void Source::handleMessage(cMessage *msg)
{
    int limit = par("limit");
    if (msg == timeoutEvent) {

        if(msgcount < limit){
            // If we receive the timeout event, no ACK was received in time and the timer expired
            EV << "Timeout expired, re-sending message and restarting timer\n";
            cPacket *newMsg = new cPacket("packet");
            newMsg->setBitLength(8);
                cPacket*copy = newMsg->dup();
                send(newMsg, "out");
                msgcount++;

            scheduleAt(simTime()+timeout, timeoutEvent);
            }
        else { // ACK received
            EV << "End of simulation" << "Packet Count: " << msgcount;
        }
        }
    else {
        if (msgcount >= limit){
            EV << "End of simulation" << "Packet Count: " << msgcount;
        }
        else {
            // delete the received message and cancel the timeout event.
            EV << "Timeout cancelled.\n";
            cancelEvent(timeoutEvent);
            delete msg;

            // Send another packet.
            cPacket *newMsg = new cPacket("packet");
            newMsg->setBitLength(8);
                cPacket*copy=newMsg->dup();
                send(newMsg, "out");
                msgcount++;
            scheduleAt(simTime()+timeout, timeoutEvent);
        }
    }
    }

class Destination : public cSimpleModule
{
    private :
        long delayCount;
        cHistogram delayStats;
        cOutVector delayVector;

    protected :
        virtual void initialize() override;
        virtual void handleMessage(cMessage *msg) override;
        virtual void finish() override;
        double prob;

};

Define_Module(Destination);

void Destination::initialize()
{
    delayCount = 0;
    WATCH(delayCount);
    delayStats.setName("delayStats");
    delayVector.setName("delay");

}

void Destination::handleMessage(cMessage *msg)
{
    cPacket*packet =check_and_cast<cPacket *>(msg);
    if (packet->hasBitError()) {
        int delay = delayCount;
        EV << "\"Message\" lost.\n";
        bubble("message lost"); // use animation
        delayCount++;
        delayVector.record(delay);
        delayStats.collect(delay);

        EV << delayCount << endl;

        delete msg;
    }
    else {
        EV << "Sending back same message as ACK.\n";
        send(msg, "out");
    }
}

void Destination::finish(){
    EV << "Delay: " << delayCount << "s" << endl;

    recordScalar("#delay", delayCount);

    delayStats.recordAs("delay");
//    delayStats.recordAs("delay");

}
