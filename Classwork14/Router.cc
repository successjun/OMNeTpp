//Replace the Router.cc code in the queueinglib with this code
#include "Router.h"

namespace queueing {

Define_Module(Router);

void Router::initialize()
{
    const char *algName = par("routingAlgorithm");
    if (strcmp(algName, "random") == 0) {
        routingAlgorithm = ALG_RANDOM;
    }
    else if (strcmp(algName, "roundRobin") == 0) {
        routingAlgorithm = ALG_ROUND_ROBIN;
    }
    else if (strcmp(algName, "minQueueLength") == 0) {
        routingAlgorithm = ALG_MIN_QUEUE_LENGTH;
    }
    else if (strcmp(algName, "minDelay") == 0) {
        routingAlgorithm = ALG_MIN_DELAY;
    }
    else if (strcmp(algName, "minServiceTime") == 0) {
        routingAlgorithm = ALG_MIN_SERVICE_TIME;
    }
    rrCounter = 0;
}

void Router::handleMessage(cMessage *msg)
{
    int outGateIndex = -1;  // by default we drop the message

    switch (routingAlgorithm) {
        case ALG_RANDOM:
            outGateIndex = par("randomGateIndex");
            break;

        case ALG_ROUND_ROBIN:
            outGateIndex = rrCounter;
            rrCounter = (rrCounter + 1) % gateSize("out");
            break;

        case ALG_MIN_QUEUE_LENGTH:
        {
            int minQueueLength = INT_MAX;
            for(int i=0; i < gateSize("out"); ++i){
                QueueType* queue = check_and_cast<QueueType*>(gate("out",i)->getPathEndGate()->getOwnerModule());
                int queueLength = queue->length();
                if(queueLength < minQueueLength){
                    minQueueLength = queueLength;
                    outGateIndex = i;
                }
            }
            if (outGateIndex == -1) throw cRuntimeError("No suitable gate found for ALG_MIN_QUEUE_LENGTH");
            break;
        }

        case ALG_MIN_DELAY:
        {
            simtime_t minDelay = SIMTIME_MAX;
            for(int i=0;i<gateSize("out"); ++i){
                DelayEstimator* delayEstimator = check_and_cast<DelayEstimator*>(gate("out", i)->getPathEndGate()->getOwnerModule());
                simtime_t delay = delayEstimator->estimateDelay();
                if(delay<minDelay){
                    minDelay = delay;
                    outGateIndex = i;
                }
             }
             if(outGateIndex == -1) throw cRuntimeError("No suitable gate found for ALG_MIN_DELAY");
             break;
        }

        case ALG_MIN_SERVICE_TIME:
        {
            simtime_t minServiceTime=SIMTIME_MAX;
            for(int i=0;i<gateSize("out"); ++i){
                ServiceTimeEstimator* serviceTimeEstimator = check_and_cast<ServiceTimeEstimator*>(gate("out".i)->getPathEndGate()->getOwnerModule());
                simtime_t serviceTime = serviceTimeEstimator->estimateServiceTime();
                if(serviceTime<minServiceTime){
                    minServiceTime=serviceTime;
                    outGateIndex = i;
                }
            }
            if(outGateIndex == -1) throw cRuntimeError("No suitable gate found for ALG_MIN_SERVICE_TIME");
            break;
        }
        default:
            outGateIndex = -1;
            break;
    }

    // send out if the index is legal
    if (outGateIndex < 0 || outGateIndex >= gateSize("out"))
        throw cRuntimeError("Invalid output gate selected during routing");

    send(msg, "out", outGateIndex);
}

}; //namespace
