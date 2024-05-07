import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Delay;


network BIA
{
    parameters:
        @display("i=block/network2");
    submodules:
        inbound: Source {
            @display("i=block/arrival;p=44,154");
            @display("p=37,121");
        }
        terminal1: Queue {
            @display("p=301,145");
        }
        inboundRunway: Queue {
            @display("p=173,145");
        }
        outboundRunway: Queue {
            @display("p=431,144");
        }
        outbound: MySinkExt {
            @display("i=block/departure;p=576,148");
            @display("p=587,121");
        }


    connections:
        inbound.out --> inboundRunway.in++;
        inboundRunway.out --> terminal1.in++;
        terminal1.out --> outboundRunway.in++;
        outboundRunway.out --> outbound.in++;
}

simple Router
{
    parameters:
        @group(Queueing);
        @display("i=block/routing");
        string routingAlgorithm @enum("random","roundRobin","shortestQueue","minDelay") = default("random");
        volatile int randomGateIndex = default(intuniform(0,sizeof(out)-1)); //the destination gate in case of random routing
    gates:
        input in[];
        output out[];
}

simple MySinkExt extends Sink
{
    @class(MySinkExt);
}
