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
        terminalRouter: Router {
            @display("p=217,175");
        }
        terminal1: Queue {
            @display("p=329,175");
        }
        runway: Queue {
            @display("p=329,41");
        }
        inboundRouter: Router {
            @display("p=167,102");
        }
        outboundRouter: Router {
            @display("p=436,175");
        }
        outbound: MySinkExt {
            @display("i=block/departure;p=578,175");
            @display("p=587,121");
        }


    connections:
        inbound.out --> inboundRouter.in++;
        inboundRouter.out++ --> runway.in++;
        runway.out --> terminalRouter.in++;
        terminalRouter.out++ --> terminal1.in++;
        terminal1.out --> outboundRouter.in++;
        outboundRouter.out++ --> runway.in++;
        runway.out --> outbound.in++;
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
