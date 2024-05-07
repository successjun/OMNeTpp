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
            @display("i=block/arrival;p=53,375");
            @display("p=37,121");
        }
        gateRouter: Router {
            @display("p=166,375");
        }
        terminal1: Queue {
            @display("p=330,31");
        }
        runway: Queue {
            @display("p=601,375");
        }
        runwayRouter: Router {
            @display("p=507,375");
        }
        outbound: MySinkExt {
            @display("i=block/departure;p=690,375");
            @display("p=587,121");
        }


    connections:
        inbound.out --> gateRouter.in++;
        gateRouter.out++ --> terminal1.in++;
        terminal1.out --> runwayRouter.in++;
        runwayRouter.out++ --> runway.in++;
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
