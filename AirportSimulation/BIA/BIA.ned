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
        gate1: Queue {
            @display("p=330,31");
        }
        gate2: Queue {
            @display("p=330,94");
        }
        gate3: Queue {
            @display("p=330,160");
        }
        gate4: Queue {
            @display("p=330,227");
        }
        gate5: Queue {
            @display("p=330,289");
        }
        gate6: Queue {
            @display("p=330,349");
        }
        gate7: Queue {
            @display("p=330,415");
        }
        gate8: Queue {
            @display("p=330,476");
        }
        gate9: Queue {
            @display("p=330,540");
        }
        gate10: Queue {
            @display("p=330,602");
        }
        gate11: Queue {
            @display("p=330,670");
        }
        gate12: Queue {
            @display("p=330,742");
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
        gateRouter.out++ --> gate1.in++;
        gateRouter.out++ --> gate2.in++;
        gateRouter.out++ --> gate3.in++;
        gateRouter.out++ --> gate4.in++;
        gateRouter.out++ --> gate5.in++;
        gateRouter.out++ --> gate6.in++;
        gateRouter.out++ --> gate7.in++;
        gateRouter.out++ --> gate8.in++;
        gateRouter.out++ --> gate9.in++;
        gateRouter.out++ --> gate10.in++;
        gateRouter.out++ --> gate11.in++;
        gateRouter.out++ --> gate12.in++;
        gate1.out --> runwayRouter.in++;
        gate2.out --> runwayRouter.in++;
        gate3.out --> runwayRouter.in++;
        gate4.out --> runwayRouter.in++;
        gate5.out --> runwayRouter.in++;
        gate6.out --> runwayRouter.in++;
        gate7.out --> runwayRouter.in++;
        gate8.out --> runwayRouter.in++;
        gate9.out --> runwayRouter.in++;
        gate10.out --> runwayRouter.in++;
        gate11.out --> runwayRouter.in++;
        gate12.out --> runwayRouter.in++;
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
