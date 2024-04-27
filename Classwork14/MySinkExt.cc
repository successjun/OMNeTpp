#include "MySinkExt.h"

Define_Module (MySinkExt);

void MySinkExt::initialize()
{
    Sink::initialize();
}


void MySinkExt::handleMessage(cMessage *msg)
{
    simtime_t delay = simTime()-msg->getTimestamp();
    histogram.collect(delay);
    Sink::handleMessage(msg);

}

void MySinkExt::finish()
{
    histogram.record();
}
