#ifndef __MYSINKEXT_H__
#define __MYSINKEXT_H__

#include <omnetpp.h>
#include "Sink.h"

using namespace omnetpp;

class MySinkExt : public queueing::Sink
{
    protected:
       cHistogram histogram;
       virtual void initialize();
       virtual void handleMessage(cMessage *msg);
};

#endif
